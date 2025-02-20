module Gio.File;

public import Gio.FileIfaceProxy;
import GLib.Bytes;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;
import Gio.AppInfo;
import Gio.AppInfoT;
import Gio.AsyncResult;
import Gio.AsyncResultT;
import Gio.Cancellable;
import Gio.FileAttributeInfoList;
import Gio.FileEnumerator;
import Gio.FileIOStream;
import Gio.FileInfo;
import Gio.FileInputStream;
import Gio.FileMonitor;
import Gio.FileOutputStream;
import Gio.Mount;
import Gio.MountOperation;
import Gio.MountT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GFile` is a high level abstraction for manipulating files on a
 * virtual file system. `GFile`s are lightweight, immutable objects
 * that do no I/O upon creation. It is necessary to understand that
 * `GFile` objects do not represent files, merely an identifier for a
 * file. All file content I/O is implemented as streaming operations
 * $(LPAREN)see [Gio.InputStream] and [Gio.OutputStream]$(RPAREN).
 * To construct a `GFile`, you can use:
 * - [Gio.File.newForPath] if you have a path.
 * - [Gio.File.newForUri] if you have a URI.
 * - [Gio.File.newForCommandlineArg] or
 * [Gio.File.newForCommandlineArgAndCwd] for a command line
 * argument.
 * - [Gio.File.newTmp] to create a temporary file from a template.
 * - [Gio.File.newTmpAsync] to asynchronously create a temporary file.
 * - [Gio.File.newTmpDirAsync] to asynchronously create a temporary
 * directory.
 * - [Gio.File.parseName] from a UTF-8 string gotten from
 * [Gio.File.getParseName].
 * - [Gio.File.newBuildFilename] or [Gio.File.newBuildFilenamev]
 * to create a file from path elements.
 * One way to think of a `GFile` is as an abstraction of a pathname. For
 * normal files the system pathname is what is stored internally, but as
 * `GFile`s are extensible it could also be something else that corresponds
 * to a pathname in a userspace implementation of a filesystem.
 * `GFile`s make up hierarchies of directories and files that correspond to
 * the files on a filesystem. You can move through the file system with
 * `GFile` using [Gio.File.getParent] to get an identifier for the
 * parent directory, [Gio.File.getChild] to get a child within a
 * directory, and [Gio.File.resolveRelativePath] to resolve a relative
 * path between two `GFile`s. There can be multiple hierarchies, so you may not
 * end up at the same root if you repeatedly call [Gio.File.getParent]
 * on two different files.
 * All `GFile`s have a basename $(LPAREN)get with [Gio.File.getBasename]$(RPAREN). These
 * names are byte strings that are used to identify the file on the filesystem
 * $(LPAREN)relative to its parent directory$(RPAREN) and there is no guarantees that they
 * have any particular charset encoding or even make any sense at all. If
 * you want to use filenames in a user interface you should use the display
 * name that you can get by requesting the
 * `G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME` attribute with
 * [Gio.File.queryInfo]. This is guaranteed to be in UTF-8 and can be
 * used in a user interface. But always store the real basename or the `GFile`
 * to use to actually access the file, because there is no way to go from a
 * display name to the actual name.
 * Using `GFile` as an identifier has the same weaknesses as using a path
 * in that there may be multiple aliases for the same file. For instance,
 * hard or soft links may cause two different `GFile`s to refer to the same
 * file. Other possible causes for aliases are: case insensitive filesystems,
 * short and long names on FAT/NTFS, or bind mounts in Linux. If you want to
 * check if two `GFile`s point to the same file you can query for the
 * `G_FILE_ATTRIBUTE_ID_FILE` attribute. Note that `GFile` does some trivial
 * canonicalization of pathnames passed in, so that trivial differences in
 * the path string used at creation $(LPAREN)duplicated slashes, slash at end of
 * path, `.` or `..` path segments, etc$(RPAREN) does not create different `GFile`s.
 * Many `GFile` operations have both synchronous and asynchronous versions
 * to suit your application. Asynchronous versions of synchronous functions
 * simply have `_async$(LPAREN)$(RPAREN)` appended to their function names. The asynchronous
 * I/O functions call a [Gio.AsyncReadyCallback] which is then used to
 * finalize the operation, producing a [Gio.AsyncResult] which is then
 * passed to the function’s matching `_finish$(LPAREN)$(RPAREN)` operation.
 * It is highly recommended to use asynchronous calls when running within a
 * shared main loop, such as in the main thread of an application. This avoids
 * I/O operations blocking other sources on the main loop from being dispatched.
 * Synchronous I/O operations should be performed from worker threads. See the
 * [introduction to asynchronous programming section](overview.html#asynchronous-programming)
 * for more.
 * Some `GFile` operations almost always take a noticeable amount of time, and
 * so do not have synchronous analogs. Notable cases include:
 * - [Gio.File.mountMountable] to mount a mountable file.
 * - [Gio.File.unmountMountableWithOperation] to unmount a mountable
 * file.
 * - [Gio.File.ejectMountableWithOperation] to eject a mountable file.
 * ## Entity Tags
 * One notable feature of `GFile`s are entity tags, or ‘etags’ for
 * short. Entity tags are somewhat like a more abstract version of the
 * traditional mtime, and can be used to quickly determine if the file
 * has been modified from the version on the file system. See the
 * HTTP 1.1
 * [specification](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html)
 * for HTTP `ETag` headers, which are a very similar concept.
 */
interface File
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_file_get_type != &gidSymbolNotFound ? g_file_get_type() : cast(GType)0;
  }

  /**
   * Constructs a #GFile from a vector of elements using the correct
   * separator for filenames.
   * Using this function is equivalent to calling [GLib.Global.buildFilenamev],
   * followed by [Gio.File.newForPath] on the result.
   * Params:
   *   args = %NULL-terminated
   *     array of strings containing the path elements.
   * Returns: a new #GFile
   */
  static File newBuildFilenamev(string[] args)
  {
    GFile* _cretval;
    const(char)*[] _tmpargs;
    foreach (s; args)
      _tmpargs ~= s.toCString(No.Alloc);
    _tmpargs ~= null;
    const(char*)* _args = _tmpargs.ptr;
    _cretval = g_file_new_build_filenamev(_args);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a #GFile with the given argument from the command line.
   * The value of arg can be either a URI, an absolute path or a
   * relative path resolved relative to the current working directory.
   * This operation never fails, but the returned object might not
   * support any I/O operation if arg points to a malformed path.
   * Note that on Windows, this function expects its argument to be in
   * UTF-8 -- not the system code page.  This means that you
   * should not use this function with string from argv as it is passed
   * to main$(LPAREN)$(RPAREN).  g_win32_get_command_line$(LPAREN)$(RPAREN) will return a UTF-8 version of
   * the commandline.  #GApplication also uses UTF-8 but
   * [Gio.ApplicationCommandLine.createFileForArg] may be more useful
   * for you there.  It is also always possible to use this function with
   * #GOptionContext arguments of type %G_OPTION_ARG_FILENAME.
   * Params:
   *   arg = a command line string
   * Returns: a new #GFile.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  static File newForCommandlineArg(string arg)
  {
    GFile* _cretval;
    const(char)* _arg = arg.toCString(No.Alloc);
    _cretval = g_file_new_for_commandline_arg(_arg);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a #GFile with the given argument from the command line.
   * This function is similar to [Gio.File.newForCommandlineArg] except
   * that it allows for passing the current working directory as an
   * argument instead of using the current working directory of the
   * process.
   * This is useful if the commandline argument was given in a context
   * other than the invocation of the current process.
   * See also [Gio.ApplicationCommandLine.createFileForArg].
   * Params:
   *   arg = a command line string
   *   cwd = the current working directory of the commandline
   * Returns: a new #GFile
   */
  static File newForCommandlineArgAndCwd(string arg, string cwd)
  {
    GFile* _cretval;
    const(char)* _arg = arg.toCString(No.Alloc);
    const(char)* _cwd = cwd.toCString(No.Alloc);
    _cretval = g_file_new_for_commandline_arg_and_cwd(_arg, _cwd);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Constructs a #GFile for a given path. This operation never
   * fails, but the returned object might not support any I/O
   * operation if path is malformed.
   * Params:
   *   path = a string containing a relative or absolute path.
   *     The string must be encoded in the glib filename encoding.
   * Returns: a new #GFile for the given path.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  static File newForPath(string path)
  {
    GFile* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_file_new_for_path(_path);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Constructs a #GFile for a given URI. This operation never
   * fails, but the returned object might not support any I/O
   * operation if uri is malformed or if the uri type is
   * not supported.
   * Params:
   *   uri = a UTF-8 string containing a URI
   * Returns: a new #GFile for the given uri.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  static File newForUri(string uri)
  {
    GFile* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = g_file_new_for_uri(_uri);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Opens a file in the preferred directory for temporary files $(LPAREN)as
   * returned by [GLib.Global.getTmpDir]$(RPAREN) and returns a #GFile and
   * #GFileIOStream pointing to it.
   * tmpl should be a string in the GLib file name encoding
   * containing a sequence of six 'X' characters, and containing no
   * directory components. If it is %NULL, a default template is used.
   * Unlike the other #GFile constructors, this will return %NULL if
   * a temporary file could not be created.
   * Params:
   *   tmpl = Template for the file
   *     name, as in [GLib.Global.fileOpenTmp], or %NULL for a default template
   *   iostream = on return, a #GFileIOStream for the created file
   * Returns: a new #GFile.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  static File newTmp(string tmpl, out FileIOStream iostream)
  {
    GFile* _cretval;
    const(char)* _tmpl = tmpl.toCString(No.Alloc);
    GFileIOStream* _iostream;
    GError *_err;
    _cretval = g_file_new_tmp(_tmpl, &_iostream, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    iostream = new FileIOStream(cast(void*)_iostream, Yes.Take);
    return _retval;
  }

  /**
   * Asynchronously opens a file in the preferred directory for temporary files
   * $(LPAREN)as returned by [GLib.Global.getTmpDir]$(RPAREN) as [Gio.File.newTmp].
   * tmpl should be a string in the GLib file name encoding
   * containing a sequence of six 'X' characters, and containing no
   * directory components. If it is %NULL, a default template is used.
   * Params:
   *   tmpl = Template for the file
   *     name, as in [GLib.Global.fileOpenTmp], or %NULL for a default template
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call when the request is done
   */
  static void newTmpAsync(string tmpl, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }

    const(char)* _tmpl = tmpl.toCString(No.Alloc);
    auto _callback = freezeDelegate(cast(void*)&callback);
    g_file_new_tmp_async(_tmpl, ioPriority, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_callbackCallback, _callback);
  }

  /**
   * Asynchronously creates a directory in the preferred directory for
   * temporary files $(LPAREN)as returned by [GLib.Global.getTmpDir]$(RPAREN) as [GLib.Dir.makeTmp].
   * tmpl should be a string in the GLib file name encoding
   * containing a sequence of six 'X' characters, and containing no
   * directory components. If it is %NULL, a default template is used.
   * Params:
   *   tmpl = Template for the file
   *     name, as in [GLib.Dir.makeTmp], or %NULL for a default template
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call when the request is done
   */
  static void newTmpDirAsync(string tmpl, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }

    const(char)* _tmpl = tmpl.toCString(No.Alloc);
    auto _callback = freezeDelegate(cast(void*)&callback);
    g_file_new_tmp_dir_async(_tmpl, ioPriority, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_callbackCallback, _callback);
  }

  /**
   * Finishes a temporary directory creation started by
   * [Gio.File.newTmpDirAsync].
   * Params:
   *   result = a #GAsyncResult
   * Returns: a new #GFile.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  static File newTmpDirFinish(AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = g_file_new_tmp_dir_finish(result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Finishes a temporary file creation started by [Gio.File.newTmpAsync].
   * Params:
   *   result = a #GAsyncResult
   *   iostream = on return, a #GFileIOStream for the created file
   * Returns: a new #GFile.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  static File newTmpFinish(AsyncResult result, out FileIOStream iostream)
  {
    GFile* _cretval;
    GFileIOStream* _iostream;
    GError *_err;
    _cretval = g_file_new_tmp_finish(result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_iostream, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    iostream = new FileIOStream(cast(void*)_iostream, Yes.Take);
    return _retval;
  }

  /**
   * Constructs a #GFile with the given parse_name $(LPAREN)i.e. something
   * given by [Gio.File.getParseName]$(RPAREN). This operation never fails,
   * but the returned object might not support any I/O operation if
   * the parse_name cannot be parsed.
   * Params:
   *   parseName = a file name or path to be parsed
   * Returns: a new #GFile.
   */
  static File parseName(string parseName)
  {
    GFile* _cretval;
    const(char)* _parseName = parseName.toCString(No.Alloc);
    _cretval = g_file_parse_name(_parseName);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets an output stream for appending data to the file.
   * If the file doesn't already exist it is created.
   * By default files created are generally readable by everyone,
   * but if you pass %G_FILE_CREATE_PRIVATE in flags the file
   * will be made readable only to the current user, to the level that
   * is supported on the target filesystem.
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * Some file systems don't allow all file names, and may return an
   * %G_IO_ERROR_INVALID_FILENAME error. If the file is a directory the
   * %G_IO_ERROR_IS_DIRECTORY error will be returned. Other errors are
   * possible too, and depend on what kind of filesystem the file is on.
   * Params:
   *   flags = a set of #GFileCreateFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileOutputStream, or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileOutputStream appendTo(FileCreateFlags flags, Cancellable cancellable);

  /**
   * Asynchronously opens file for appending.
   * For more details, see [Gio.File.appendTo] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.appendToFinish] to get the result
   * of the operation.
   * Params:
   *   flags = a set of #GFileCreateFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void appendToAsync(FileCreateFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file append operation started with
   * [Gio.File.appendToAsync].
   * Params:
   *   res = #GAsyncResult
   * Returns: a valid #GFileOutputStream
   *   or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileOutputStream appendToFinish(AsyncResult res);

  /**
   * Prepares the file attribute query string for copying to file.
   * This function prepares an attribute query string to be
   * passed to [Gio.File.queryInfo] to get a list of attributes
   * normally copied with the file $(LPAREN)see [Gio.File.copyAttributes]
   * for the detailed description$(RPAREN). This function is used by the
   * implementation of [Gio.File.copyAttributes] and is useful
   * when one needs to query and set the attributes in two
   * stages $(LPAREN)e.g., for recursive move of a directory$(RPAREN).
   * Params:
   *   flags = a set of #GFileCopyFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: an attribute query string for [Gio.File.queryInfo],
   *   or %NULL if an error occurs.
   */
  string buildAttributeListForCopy(FileCopyFlags flags, Cancellable cancellable);

  /**
   * Copies the file source to the location specified by destination.
   * Can not handle recursive copies of directories.
   * If the flag %G_FILE_COPY_OVERWRITE is specified an already
   * existing destination file is overwritten.
   * If the flag %G_FILE_COPY_NOFOLLOW_SYMLINKS is specified then symlinks
   * will be copied as symlinks, otherwise the target of the
   * source symlink will be copied.
   * If the flag %G_FILE_COPY_ALL_METADATA is specified then all the metadata
   * that is possible to copy is copied, not just the default subset $(LPAREN)which,
   * for instance, does not include the owner, see #GFileInfo$(RPAREN).
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * If progress_callback is not %NULL, then the operation can be monitored
   * by setting this to a #GFileProgressCallback function.
   * progress_callback_data will be passed to this function. It is guaranteed
   * that this callback will be called after all data has been transferred with
   * the total number of bytes copied during the operation.
   * If the source file does not exist, then the %G_IO_ERROR_NOT_FOUND error
   * is returned, independent on the status of the destination.
   * If %G_FILE_COPY_OVERWRITE is not specified and the target exists, then
   * the error %G_IO_ERROR_EXISTS is returned.
   * If trying to overwrite a file over a directory, the %G_IO_ERROR_IS_DIRECTORY
   * error is returned. If trying to overwrite a directory with a directory the
   * %G_IO_ERROR_WOULD_MERGE error is returned.
   * If the source is a directory and the target does not exist, or
   * %G_FILE_COPY_OVERWRITE is specified and the target is a file, then the
   * %G_IO_ERROR_WOULD_RECURSE error is returned.
   * If you are interested in copying the #GFile object itself $(LPAREN)not the on-disk
   * file$(RPAREN), see [Gio.File.dup].
   * Params:
   *   destination = destination #GFile
   *   flags = set of #GFileCopyFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   progressCallback = function to callback with
   *     progress information, or %NULL if progress information is not needed
   * Returns: %TRUE on success, %FALSE otherwise.
   */
  bool copy(File destination, FileCopyFlags flags, Cancellable cancellable, FileProgressCallback progressCallback);

  /**
   * Copies the file source to the location specified by destination
   * asynchronously. For details of the behaviour, see [Gio.File.copy].
   * If progress_callback is not %NULL, then that function that will be called
   * just like in [Gio.File.copy]. The callback will run in the default main context
   * of the thread calling [Gio.File.copyAsync] — the same context as callback is
   * run in.
   * When the operation is finished, callback will be called. You can then call
   * [Gio.File.copyFinish] to get the result of the operation.
   * Params:
   *   destination = destination #GFile
   *   flags = set of #GFileCopyFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   progressCallback = function to callback with progress information, or %NULL if
   *     progress information is not needed
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void copyAsync(File destination, FileCopyFlags flags, int ioPriority, Cancellable cancellable, FileProgressCallback progressCallback, AsyncReadyCallback callback);

  /**
   * Copies the file attributes from source to destination.
   * Normally only a subset of the file attributes are copied,
   * those that are copies in a normal file copy operation
   * $(LPAREN)which for instance does not include e.g. owner$(RPAREN). However
   * if %G_FILE_COPY_ALL_METADATA is specified in flags, then
   * all the metadata that is possible to copy is copied. This
   * is useful when implementing move by copy + delete source.
   * Params:
   *   destination = a #GFile to copy attributes to
   *   flags = a set of #GFileCopyFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attributes were copied successfully,
   *   %FALSE otherwise.
   */
  bool copyAttributes(File destination, FileCopyFlags flags, Cancellable cancellable);

  /**
   * Finishes copying the file started with [Gio.File.copyAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a %TRUE on success, %FALSE on error.
   */
  bool copyFinish(AsyncResult res);

  /**
   * Creates a new file and returns an output stream for writing to it.
   * The file must not already exist.
   * By default files created are generally readable by everyone,
   * but if you pass %G_FILE_CREATE_PRIVATE in flags the file
   * will be made readable only to the current user, to the level
   * that is supported on the target filesystem.
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * If a file or directory with this name already exists the
   * %G_IO_ERROR_EXISTS error will be returned. Some file systems don't
   * allow all file names, and may return an %G_IO_ERROR_INVALID_FILENAME
   * error, and if the name is to long %G_IO_ERROR_FILENAME_TOO_LONG will
   * be returned. Other errors are possible too, and depend on what kind
   * of filesystem the file is on.
   * Params:
   *   flags = a set of #GFileCreateFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileOutputStream for the newly created
   *   file, or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileOutputStream create(FileCreateFlags flags, Cancellable cancellable);

  /**
   * Asynchronously creates a new file and returns an output stream
   * for writing to it. The file must not already exist.
   * For more details, see [Gio.File.create] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.createFinish] to get the result
   * of the operation.
   * Params:
   *   flags = a set of #GFileCreateFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void createAsync(FileCreateFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file create operation started with
   * [Gio.File.createAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFileOutputStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileOutputStream createFinish(AsyncResult res);

  /**
   * Creates a new file and returns a stream for reading and
   * writing to it. The file must not already exist.
   * By default files created are generally readable by everyone,
   * but if you pass %G_FILE_CREATE_PRIVATE in flags the file
   * will be made readable only to the current user, to the level
   * that is supported on the target filesystem.
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * If a file or directory with this name already exists, the
   * %G_IO_ERROR_EXISTS error will be returned. Some file systems don't
   * allow all file names, and may return an %G_IO_ERROR_INVALID_FILENAME
   * error, and if the name is too long, %G_IO_ERROR_FILENAME_TOO_LONG
   * will be returned. Other errors are possible too, and depend on what
   * kind of filesystem the file is on.
   * Note that in many non-local file cases read and write streams are
   * not supported, so make sure you really need to do read and write
   * streaming, rather than just opening for reading or writing.
   * Params:
   *   flags = a set of #GFileCreateFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileIOStream for the newly created
   *   file, or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileIOStream createReadwrite(FileCreateFlags flags, Cancellable cancellable);

  /**
   * Asynchronously creates a new file and returns a stream
   * for reading and writing to it. The file must not already exist.
   * For more details, see [Gio.File.createReadwrite] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.createReadwriteFinish] to get
   * the result of the operation.
   * Params:
   *   flags = a set of #GFileCreateFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void createReadwriteAsync(FileCreateFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file create operation started with
   * [Gio.File.createReadwriteAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFileIOStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileIOStream createReadwriteFinish(AsyncResult res);

  /**
   * Deletes a file. If the file is a directory, it will only be
   * deleted if it is empty. This has the same semantics as [GLib.Global.unlink].
   * If file doesn’t exist, %G_IO_ERROR_NOT_FOUND will be returned. This allows
   * for deletion to be implemented avoiding
   * [time-of-check to time-of-use races](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use):
   * |[
   * g_autoptr$(LPAREN)GError$(RPAREN) local_error \= NULL;
   * if $(LPAREN)!g_file_delete $(LPAREN)my_file, my_cancellable, &local_error$(RPAREN) &&
   * !g_error_matches $(LPAREN)local_error, G_IO_ERROR, G_IO_ERROR_NOT_FOUND$(RPAREN)$(RPAREN)
   * {
   * // deletion failed for some reason other than the file not existing:
   * // so report the error
   * g_warning $(LPAREN)"Failed to delete %s: %s",
   * g_file_peek_path $(LPAREN)my_file$(RPAREN), local_error->message$(RPAREN);
   * }
   * ]|
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the file was deleted. %FALSE otherwise.
   */
  bool delete_(Cancellable cancellable);

  /**
   * Asynchronously delete a file. If the file is a directory, it will
   * only be deleted if it is empty.  This has the same semantics as
   * [GLib.Global.unlink].
   * Params:
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied
   */
  void deleteAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes deleting a file started with [Gio.File.deleteAsync].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the file was deleted. %FALSE otherwise.
   */
  bool deleteFinish(AsyncResult result);

  /**
   * Duplicates a #GFile handle. This operation does not duplicate
   * the actual file or directory represented by the #GFile; see
   * [Gio.File.copy] if attempting to copy a file.
   * [Gio.File.dup] is useful when a second handle is needed to the same underlying
   * file, for use in a separate thread $(LPAREN)#GFile is not thread-safe$(RPAREN). For use
   * within the same thread, use [GObject.ObjectG.ref_] to increment the existing object’s
   * reference count.
   * This call does no blocking I/O.
   * Returns: a new #GFile that is a duplicate
   *   of the given #GFile.
   */
  File dup();

  /**
   * Starts an asynchronous eject on a mountable.
   * When this operation has completed, callback will be called with
   * user_user data, and the operation can be finalized with
   * [Gio.File.ejectMountableFinish].
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   flags = flags affecting the operation
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied

   * Deprecated: Use [Gio.File.ejectMountableWithOperation] instead.
   */
  void ejectMountable(MountUnmountFlags flags, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous eject operation started by
   * [Gio.File.ejectMountable].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the file was ejected successfully.
   *   %FALSE otherwise.

   * Deprecated: Use [Gio.File.ejectMountableWithOperationFinish]
   *   instead.
   */
  bool ejectMountableFinish(AsyncResult result);

  /**
   * Starts an asynchronous eject on a mountable.
   * When this operation has completed, callback will be called with
   * user_user data, and the operation can be finalized with
   * [Gio.File.ejectMountableWithOperationFinish].
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   flags = flags affecting the operation
   *   mountOperation = a #GMountOperation,
   *     or %NULL to avoid user interaction
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void ejectMountableWithOperation(MountUnmountFlags flags, MountOperation mountOperation, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous eject operation started by
   * [Gio.File.ejectMountableWithOperation].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the file was ejected successfully.
   *   %FALSE otherwise.
   */
  bool ejectMountableWithOperationFinish(AsyncResult result);

  /**
   * Gets the requested information about the files in a directory.
   * The result is a #GFileEnumerator object that will give out
   * #GFileInfo objects for all the files in the directory.
   * The attributes value is a string that specifies the file
   * attributes that should be gathered. It is not an error if
   * it's not possible to read a particular requested attribute
   * from a file - it just won't be set. attributes should
   * be a comma-separated list of attributes or attribute wildcards.
   * The wildcard "*" means all attributes, and a wildcard like
   * "standard::*" means all attributes in the standard namespace.
   * An example attribute query be "standard::*,owner::user".
   * The standard attributes are available as defines, like
   * %G_FILE_ATTRIBUTE_STANDARD_NAME. %G_FILE_ATTRIBUTE_STANDARD_NAME should
   * always be specified if you plan to call [Gio.FileEnumerator.getChild] or
   * [Gio.FileEnumerator.iterate] on the returned enumerator.
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will
   * be returned. If the file is not a directory, the %G_IO_ERROR_NOT_DIRECTORY
   * error will be returned. Other errors are possible too.
   * Params:
   *   attributes = an attribute query string
   *   flags = a set of #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: A #GFileEnumerator if successful,
   *   %NULL on error. Free the returned object with [GObject.ObjectG.unref].
   */
  FileEnumerator enumerateChildren(string attributes, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Asynchronously gets the requested information about the files
   * in a directory. The result is a #GFileEnumerator object that will
   * give out #GFileInfo objects for all the files in the directory.
   * For more details, see [Gio.File.enumerateChildren] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called. You can
   * then call [Gio.File.enumerateChildrenFinish] to get the result of
   * the operation.
   * Params:
   *   attributes = an attribute query string
   *   flags = a set of #GFileQueryInfoFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void enumerateChildrenAsync(string attributes, FileQueryInfoFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an async enumerate children operation.
   * See [Gio.File.enumerateChildrenAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFileEnumerator or %NULL
   *   if an error occurred.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileEnumerator enumerateChildrenFinish(AsyncResult res);

  /**
   * Checks if the two given #GFiles refer to the same file.
   * Note that two #GFiles that differ can still refer to the same
   * file on the filesystem due to various forms of filename
   * aliasing.
   * This call does no blocking I/O.
   * Params:
   *   file2 = the second #GFile
   * Returns: %TRUE if file1 and file2 are equal.
   */
  bool equal(File file2);

  /**
   * Gets a #GMount for the #GFile.
   * #GMount is returned only for user interesting locations, see
   * #GVolumeMonitor. If the #GFileIface for file does not have a #mount,
   * error will be set to %G_IO_ERROR_NOT_FOUND and %NULL #will be returned.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GMount where the file is located
   *   or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  Mount findEnclosingMount(Cancellable cancellable);

  /**
   * Asynchronously gets the mount for the file.
   * For more details, see [Gio.File.findEnclosingMount] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.findEnclosingMountFinish] to
   * get the result of the operation.
   * Params:
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void findEnclosingMountAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous find mount request.
   * See [Gio.File.findEnclosingMountAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: #GMount for given file or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  Mount findEnclosingMountFinish(AsyncResult res);

  /**
   * Gets the base name $(LPAREN)the last component of the path$(RPAREN) for a given #GFile.
   * If called for the top level of a system $(LPAREN)such as the filesystem root
   * or a uri like sftp://host/$(RPAREN) it will return a single directory separator
   * $(LPAREN)and on Windows, possibly a drive letter$(RPAREN).
   * The base name is a byte string $(LPAREN)not UTF-8$(RPAREN). It has no defined encoding
   * or rules other than it may not contain zero bytes.  If you want to use
   * filenames in a user interface you should use the display name that you
   * can get by requesting the %G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME
   * attribute with [Gio.File.queryInfo].
   * This call does no blocking I/O.
   * Returns: string containing the #GFile's
   *   base name, or %NULL if given #GFile is invalid. The returned string
   *   should be freed with [GLib.Global.gfree] when no longer needed.
   */
  string getBasename();

  /**
   * Gets a child of file with basename equal to name.
   * Note that the file with that specific name might not exist, but
   * you can still have a #GFile that points to it. You can use this
   * for instance to create that file.
   * This call does no blocking I/O.
   * Params:
   *   name = string containing the child's basename
   * Returns: a #GFile to a child specified by name.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File getChild(string name);

  /**
   * Gets the child of file for a given display_name $(LPAREN)i.e. a UTF-8
   * version of the name$(RPAREN). If this function fails, it returns %NULL
   * and error will be set. This is very useful when constructing a
   * #GFile for a new file and the user entered the filename in the
   * user interface, for instance when you select a directory and
   * type a filename in the file selector.
   * This call does no blocking I/O.
   * Params:
   *   displayName = string to a possible child
   * Returns: a #GFile to the specified child, or
   *   %NULL if the display name couldn't be converted.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File getChildForDisplayName(string displayName);

  /**
   * Gets the parent directory for the file.
   * If the file represents the root directory of the
   * file system, then %NULL will be returned.
   * This call does no blocking I/O.
   * Returns: a #GFile structure to the
   *   parent of the given #GFile or %NULL if there is no parent. Free
   *   the returned object with [GObject.ObjectG.unref].
   */
  File getParent();

  /**
   * Gets the parse name of the file.
   * A parse name is a UTF-8 string that describes the
   * file such that one can get the #GFile back using
   * [Gio.File.parseName].
   * This is generally used to show the #GFile as a nice
   * full-pathname kind of string in a user interface,
   * like in a location entry.
   * For local files with names that can safely be converted
   * to UTF-8 the pathname is used, otherwise the IRI is used
   * $(LPAREN)a form of URI that allows UTF-8 characters unescaped$(RPAREN).
   * This call does no blocking I/O.
   * Returns: a string containing the #GFile's parse name.
   *   The returned string should be freed with [GLib.Global.gfree]
   *   when no longer needed.
   */
  string getParseName();

  /**
   * Gets the local pathname for #GFile, if one exists. If non-%NULL, this is
   * guaranteed to be an absolute, canonical path. It might contain symlinks.
   * This call does no blocking I/O.
   * Returns: string containing the #GFile's path,
   *   or %NULL if no such path exists. The returned string should be freed
   *   with [GLib.Global.gfree] when no longer needed.
   */
  string getPath();

  /**
   * Gets the path for descendant relative to parent.
   * This call does no blocking I/O.
   * Params:
   *   descendant = input #GFile
   * Returns: string with the relative path from
   *   descendant to parent, or %NULL if descendant doesn't have parent as
   *   prefix. The returned string should be freed with [GLib.Global.gfree] when
   *   no longer needed.
   */
  string getRelativePath(File descendant);

  /**
   * Gets the URI for the file.
   * This call does no blocking I/O.
   * Returns: a string containing the #GFile's URI. If the #GFile was constructed
   *   with an invalid URI, an invalid URI is returned.
   *   The returned string should be freed with [GLib.Global.gfree]
   *   when no longer needed.
   */
  string getUri();

  /**
   * Gets the URI scheme for a #GFile.
   * RFC 3986 decodes the scheme as:
   * |[
   * URI \= scheme ":" hier-part [ "?" query ] [ "#" fragment ]
   * ]|
   * Common schemes include "file", "http", "ftp", etc.
   * The scheme can be different from the one used to construct the #GFile,
   * in that it might be replaced with one that is logically equivalent to the #GFile.
   * This call does no blocking I/O.
   * Returns: a string containing the URI scheme for the given
   *   #GFile or %NULL if the #GFile was constructed with an invalid URI. The
   *   returned string should be freed with [GLib.Global.gfree] when no longer needed.
   */
  string getUriScheme();

  /**
   * Checks if file has a parent, and optionally, if it is parent.
   * If parent is %NULL then this function returns %TRUE if file has any
   * parent at all.  If parent is non-%NULL then %TRUE is only returned
   * if file is an immediate child of parent.
   * Params:
   *   parent = the parent to check for, or %NULL
   * Returns: %TRUE if file is an immediate child of parent $(LPAREN)or any parent in
   *   the case that parent is %NULL$(RPAREN).
   */
  bool hasParent(File parent);

  /**
   * Checks whether file has the prefix specified by prefix.
   * In other words, if the names of initial elements of file's
   * pathname match prefix. Only full pathname elements are matched,
   * so a path like /foo is not considered a prefix of /foobar, only
   * of /foo/bar.
   * A #GFile is not a prefix of itself. If you want to check for
   * equality, use [Gio.File.equal].
   * This call does no I/O, as it works purely on names. As such it can
   * sometimes return %FALSE even if file is inside a prefix $(LPAREN)from a
   * filesystem point of view$(RPAREN), because the prefix of file is an alias
   * of prefix.
   * Params:
   *   prefix = input #GFile
   * Returns: %TRUE if the file's parent, grandparent, etc is prefix,
   *   %FALSE otherwise.
   */
  bool hasPrefix(File prefix);

  /**
   * Checks to see if a #GFile has a given URI scheme.
   * This call does no blocking I/O.
   * Params:
   *   uriScheme = a string containing a URI scheme
   * Returns: %TRUE if #GFile's backend supports the
   *   given URI scheme, %FALSE if URI scheme is %NULL,
   *   not supported, or #GFile is invalid.
   */
  bool hasUriScheme(string uriScheme);

  /**
   * Creates a hash value for a #GFile.
   * This call does no blocking I/O.
   * Returns: 0 if file is not a valid #GFile, otherwise an
   *   integer that can be used as hash value for the #GFile.
   *   This function is intended for easily hashing a #GFile to
   *   add to a #GHashTable or similar data structure.
   */
  uint hash();

  /**
   * Checks to see if a file is native to the platform.
   * A native file is one expressed in the platform-native filename format,
   * e.g. "C:\Windows" or "/usr/bin/". This does not mean the file is local,
   * as it might be on a locally mounted remote filesystem.
   * On some systems non-native files may be available using the native
   * filesystem via a userspace filesystem $(LPAREN)FUSE$(RPAREN), in these cases this call
   * will return %FALSE, but [Gio.File.getPath] will still return a native path.
   * This call does no blocking I/O.
   * Returns: %TRUE if file is native
   */
  bool isNative();

  /**
   * Loads the contents of file and returns it as #GBytes.
   * If file is a resource:// based URI, the resulting bytes will reference the
   * embedded resource instead of a copy. Otherwise, this is equivalent to calling
   * [Gio.File.loadContents] and [GLib.Bytes.newTake].
   * For resources, etag_out will be set to %NULL.
   * The data contained in the resulting #GBytes is always zero-terminated, but
   * this is not included in the #GBytes length. The resulting #GBytes should be
   * freed with [GLib.Bytes.unref] when no longer in use.
   * Params:
   *   cancellable = a #GCancellable or %NULL
   *   etagOut = a location to place the current
   *     entity tag for the file, or %NULL if the entity tag is not needed
   * Returns: a #GBytes or %NULL and error is set
   */
  Bytes loadBytes(Cancellable cancellable, out string etagOut);

  /**
   * Asynchronously loads the contents of file as #GBytes.
   * If file is a resource:// based URI, the resulting bytes will reference the
   * embedded resource instead of a copy. Otherwise, this is equivalent to calling
   * [Gio.File.loadContentsAsync] and [GLib.Bytes.newTake].
   * callback should call [Gio.File.loadBytesFinish] to get the result of this
   * asynchronous operation.
   * See [Gio.File.loadBytes] for more information.
   * Params:
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void loadBytesAsync(Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Completes an asynchronous request to [Gio.File.loadBytesAsync].
   * For resources, etag_out will be set to %NULL.
   * The data contained in the resulting #GBytes is always zero-terminated, but
   * this is not included in the #GBytes length. The resulting #GBytes should be
   * freed with [GLib.Bytes.unref] when no longer in use.
   * See [Gio.File.loadBytes] for more information.
   * Params:
   *   result = a #GAsyncResult provided to the callback
   *   etagOut = a location to place the current
   *     entity tag for the file, or %NULL if the entity tag is not needed
   * Returns: a #GBytes or %NULL and error is set
   */
  Bytes loadBytesFinish(AsyncResult result, out string etagOut);

  /**
   * Loads the content of the file into memory. The data is always
   * zero-terminated, but this is not included in the resultant length.
   * The returned contents should be freed with [GLib.Global.gfree] when no longer
   * needed.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   contents = a location to place the contents of the file
   *   etagOut = a location to place the current entity tag for the file,
   *     or %NULL if the entity tag is not needed
   * Returns: %TRUE if the file's contents were successfully loaded.
   *   %FALSE if there were errors.
   */
  bool loadContents(Cancellable cancellable, out ubyte[] contents, out string etagOut);

  /**
   * Starts an asynchronous load of the file's contents.
   * For more details, see [Gio.File.loadContents] which is
   * the synchronous version of this call.
   * When the load operation has completed, callback will be called
   * with user data. To finish the operation, call
   * [Gio.File.loadContentsFinish] with the #GAsyncResult returned by
   * the callback.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call when the request is satisfied
   */
  void loadContentsAsync(Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous load of the file's contents.
   * The contents are placed in contents, and length is set to the
   * size of the contents string. The contents should be freed with
   * [GLib.Global.gfree] when no longer needed. If etag_out is present, it will be
   * set to the new entity tag for the file.
   * Params:
   *   res = a #GAsyncResult
   *   contents = a location to place the contents of the file
   *   etagOut = a location to place the current entity tag for the file,
   *     or %NULL if the entity tag is not needed
   * Returns: %TRUE if the load was successful. If %FALSE and error is
   *   present, it will be set appropriately.
   */
  bool loadContentsFinish(AsyncResult res, out ubyte[] contents, out string etagOut);

  /**
   * Finishes an asynchronous partial load operation that was started
   * with [Gio.File.loadPartialContentsAsync]. The data is always
   * zero-terminated, but this is not included in the resultant length.
   * The returned contents should be freed with [GLib.Global.gfree] when no longer
   * needed.
   * Params:
   *   res = a #GAsyncResult
   *   contents = a location to place the contents of the file
   *   etagOut = a location to place the current entity tag for the file,
   *     or %NULL if the entity tag is not needed
   * Returns: %TRUE if the load was successful. If %FALSE and error is
   *   present, it will be set appropriately.
   */
  bool loadPartialContentsFinish(AsyncResult res, out ubyte[] contents, out string etagOut);

  /**
   * Creates a directory. Note that this will only create a child directory
   * of the immediate parent directory of the path or URI given by the #GFile.
   * To recursively create directories, see [Gio.File.makeDirectoryWithParents].
   * This function will fail if the parent directory does not exist, setting
   * error to %G_IO_ERROR_NOT_FOUND. If the file system doesn't support
   * creating directories, this function will fail, setting error to
   * %G_IO_ERROR_NOT_SUPPORTED.
   * For a local #GFile the newly created directory will have the default
   * $(LPAREN)current$(RPAREN) ownership and permissions of the current process.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE on successful creation, %FALSE otherwise.
   */
  bool makeDirectory(Cancellable cancellable);

  /**
   * Asynchronously creates a directory.
   * Params:
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied
   */
  void makeDirectoryAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous directory creation, started with
   * [Gio.File.makeDirectoryAsync].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE on successful directory creation, %FALSE otherwise.
   */
  bool makeDirectoryFinish(AsyncResult result);

  /**
   * Creates a directory and any parent directories that may not
   * exist similar to 'mkdir -p'. If the file system does not support
   * creating directories, this function will fail, setting error to
   * %G_IO_ERROR_NOT_SUPPORTED. If the directory itself already exists,
   * this function will fail setting error to %G_IO_ERROR_EXISTS, unlike
   * the similar [GLib.Global.mkdirWithParents].
   * For a local #GFile the newly created directories will have the default
   * $(LPAREN)current$(RPAREN) ownership and permissions of the current process.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if all directories have been successfully created, %FALSE
   *   otherwise.
   */
  bool makeDirectoryWithParents(Cancellable cancellable);

  /**
   * Creates a symbolic link named file which contains the string
   * symlink_value.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   symlinkValue = a string with the path for the target
   *     of the new symlink
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE on the creation of a new symlink, %FALSE otherwise.
   */
  bool makeSymbolicLink(string symlinkValue, Cancellable cancellable);

  /**
   * Asynchronously creates a symbolic link named file which contains the
   * string symlink_value.
   * Params:
   *   symlinkValue = a string with the path for the target
   *     of the new symlink
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied
   */
  void makeSymbolicLinkAsync(string symlinkValue, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous symbolic link creation, started with
   * [Gio.File.makeSymbolicLinkAsync].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE on successful directory creation, %FALSE otherwise.
   */
  bool makeSymbolicLinkFinish(AsyncResult result);

  /**
   * Recursively measures the disk usage of file.
   * This is essentially an analog of the 'du' command, but it also
   * reports the number of directories and non-directory files encountered
   * $(LPAREN)including things like symbolic links$(RPAREN).
   * By default, errors are only reported against the toplevel file
   * itself.  Errors found while recursing are silently ignored, unless
   * %G_FILE_MEASURE_REPORT_ANY_ERROR is given in flags.
   * The returned size, disk_usage, is in bytes and should be formatted
   * with [GLib.Global.formatSize] in order to get something reasonable for showing
   * in a user interface.
   * progress_callback and progress_data can be given to request
   * periodic progress updates while scanning.  See the documentation for
   * #GFileMeasureProgressCallback for information about when and how the
   * callback will be invoked.
   * Params:
   *   flags = #GFileMeasureFlags
   *   cancellable = optional #GCancellable
   *   progressCallback = a #GFileMeasureProgressCallback
   *   diskUsage = the number of bytes of disk space used
   *   numDirs = the number of directories encountered
   *   numFiles = the number of non-directories encountered
   * Returns: %TRUE if successful, with the out parameters set.
   *   %FALSE otherwise, with error set.
   */
  bool measureDiskUsage(FileMeasureFlags flags, Cancellable cancellable, FileMeasureProgressCallback progressCallback, out ulong diskUsage, out ulong numDirs, out ulong numFiles);

  /**
   * Collects the results from an earlier call to
   * [Gio.File.measureDiskUsageAsync].  See [Gio.File.measureDiskUsage] for
   * more information.
   * Params:
   *   result = the #GAsyncResult passed to your #GAsyncReadyCallback
   *   diskUsage = the number of bytes of disk space used
   *   numDirs = the number of directories encountered
   *   numFiles = the number of non-directories encountered
   * Returns: %TRUE if successful, with the out parameters set.
   *   %FALSE otherwise, with error set.
   */
  bool measureDiskUsageFinish(AsyncResult result, out ulong diskUsage, out ulong numDirs, out ulong numFiles);

  /**
   * Obtains a file or directory monitor for the given file,
   * depending on the type of the file.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   flags = a set of #GFileMonitorFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileMonitor for the given file,
   *   or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileMonitor monitor(FileMonitorFlags flags, Cancellable cancellable);

  /**
   * Obtains a directory monitor for the given file.
   * This may fail if directory monitoring is not supported.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * It does not make sense for flags to contain
   * %G_FILE_MONITOR_WATCH_HARD_LINKS, since hard links can not be made to
   * directories.  It is not possible to monitor all the files in a
   * directory for changes made via hard links; if you want to do this then
   * you must register individual watches with [Gio.File.monitor].
   * Params:
   *   flags = a set of #GFileMonitorFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileMonitor for the given file,
   *   or %NULL on error. Free the returned object with [GObject.ObjectG.unref].
   */
  FileMonitor monitorDirectory(FileMonitorFlags flags, Cancellable cancellable);

  /**
   * Obtains a file monitor for the given file. If no file notification
   * mechanism exists, then regular polling of the file is used.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * If flags contains %G_FILE_MONITOR_WATCH_HARD_LINKS then the monitor
   * will also attempt to report changes made to the file via another
   * filename $(LPAREN)ie, a hard link$(RPAREN). Without this flag, you can only rely on
   * changes made through the filename contained in file to be
   * reported. Using this flag may result in an increase in resource
   * usage, and may not have any effect depending on the #GFileMonitor
   * backend and/or filesystem type.
   * Params:
   *   flags = a set of #GFileMonitorFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileMonitor for the given file,
   *   or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileMonitor monitorFile(FileMonitorFlags flags, Cancellable cancellable);

  /**
   * Starts a mount_operation, mounting the volume that contains
   * the file location.
   * When this operation has completed, callback will be called with
   * user_user data, and the operation can be finalized with
   * [Gio.File.mountEnclosingVolumeFinish].
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   flags = flags affecting the operation
   *   mountOperation = a #GMountOperation
   *     or %NULL to avoid user interaction
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied, or %NULL
   */
  void mountEnclosingVolume(MountMountFlags flags, MountOperation mountOperation, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes a mount operation started by [Gio.File.mountEnclosingVolume].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if successful. If an error has occurred,
   *   this function will return %FALSE and set error
   *   appropriately if present.
   */
  bool mountEnclosingVolumeFinish(AsyncResult result);

  /**
   * Mounts a file of type G_FILE_TYPE_MOUNTABLE.
   * Using mount_operation, you can request callbacks when, for instance,
   * passwords are needed during authentication.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.mountMountableFinish] to get
   * the result of the operation.
   * Params:
   *   flags = flags affecting the operation
   *   mountOperation = a #GMountOperation,
   *     or %NULL to avoid user interaction
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void mountMountable(MountMountFlags flags, MountOperation mountOperation, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes a mount operation. See [Gio.File.mountMountable] for details.
   * Finish an asynchronous mount operation that was started
   * with [Gio.File.mountMountable].
   * Params:
   *   result = a #GAsyncResult
   * Returns: a #GFile or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File mountMountableFinish(AsyncResult result);

  /**
   * Tries to move the file or directory source to the location specified
   * by destination. If native move operations are supported then this is
   * used, otherwise a copy + delete fallback is used. The native
   * implementation may support moving directories $(LPAREN)for instance on moves
   * inside the same filesystem$(RPAREN), but the fallback code does not.
   * If the flag %G_FILE_COPY_OVERWRITE is specified an already
   * existing destination file is overwritten.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * If progress_callback is not %NULL, then the operation can be monitored
   * by setting this to a #GFileProgressCallback function.
   * progress_callback_data will be passed to this function. It is
   * guaranteed that this callback will be called after all data has been
   * transferred with the total number of bytes copied during the operation.
   * If the source file does not exist, then the %G_IO_ERROR_NOT_FOUND
   * error is returned, independent on the status of the destination.
   * If %G_FILE_COPY_OVERWRITE is not specified and the target exists,
   * then the error %G_IO_ERROR_EXISTS is returned.
   * If trying to overwrite a file over a directory, the %G_IO_ERROR_IS_DIRECTORY
   * error is returned. If trying to overwrite a directory with a directory the
   * %G_IO_ERROR_WOULD_MERGE error is returned.
   * If the source is a directory and the target does not exist, or
   * %G_FILE_COPY_OVERWRITE is specified and the target is a file, then
   * the %G_IO_ERROR_WOULD_RECURSE error may be returned $(LPAREN)if the native
   * move operation isn't available$(RPAREN).
   * Params:
   *   destination = #GFile pointing to the destination location
   *   flags = set of #GFileCopyFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   progressCallback = #GFileProgressCallback
   *     function for updates
   * Returns: %TRUE on successful move, %FALSE otherwise.
   */
  bool move(File destination, FileCopyFlags flags, Cancellable cancellable, FileProgressCallback progressCallback);

  /**
   * Asynchronously moves a file source to the location of destination. For details of the behaviour, see [Gio.File.move].
   * If progress_callback is not %NULL, then that function that will be called
   * just like in [Gio.File.move]. The callback will run in the default main context
   * of the thread calling [Gio.File.moveAsync] — the same context as callback is
   * run in.
   * When the operation is finished, callback will be called. You can then call
   * [Gio.File.moveFinish] to get the result of the operation.
   * Params:
   *   destination = #GFile pointing to the destination location
   *   flags = set of #GFileCopyFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   progressCallback = #GFileProgressCallback function for updates
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void moveAsync(File destination, FileCopyFlags flags, int ioPriority, Cancellable cancellable, FileProgressCallback progressCallback, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file movement, started with
   * [Gio.File.moveAsync].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE on successful file move, %FALSE otherwise.
   */
  bool moveFinish(AsyncResult result);

  /**
   * Opens an existing file for reading and writing. The result is
   * a #GFileIOStream that can be used to read and write the contents
   * of the file.
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will
   * be returned. If the file is a directory, the %G_IO_ERROR_IS_DIRECTORY
   * error will be returned. Other errors are possible too, and depend on
   * what kind of filesystem the file is on. Note that in many non-local
   * file cases read and write streams are not supported, so make sure you
   * really need to do read and write streaming, rather than just opening
   * for reading or writing.
   * Params:
   *   cancellable = a #GCancellable
   * Returns: #GFileIOStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileIOStream openReadwrite(Cancellable cancellable);

  /**
   * Asynchronously opens file for reading and writing.
   * For more details, see [Gio.File.openReadwrite] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.openReadwriteFinish] to get
   * the result of the operation.
   * Params:
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void openReadwriteAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file read operation started with
   * [Gio.File.openReadwriteAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFileIOStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileIOStream openReadwriteFinish(AsyncResult res);

  /**
   * Exactly like [Gio.File.getPath], but caches the result via
   * [GObject.ObjectG.setQdataFull].  This is useful for example in C
   * applications which mix `g_file_*` APIs with native ones.  It
   * also avoids an extra duplicated string when possible, so will be
   * generally more efficient.
   * This call does no blocking I/O.
   * Returns: string containing the #GFile's path,
   *   or %NULL if no such path exists. The returned string is owned by file.
   */
  string peekPath();

  /**
   * Polls a file of type %G_FILE_TYPE_MOUNTABLE.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.mountMountableFinish] to get
   * the result of the operation.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied, or %NULL
   */
  void pollMountable(Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes a poll operation. See [Gio.File.pollMountable] for details.
   * Finish an asynchronous poll operation that was polled
   * with [Gio.File.pollMountable].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the operation finished successfully. %FALSE
   *   otherwise.
   */
  bool pollMountableFinish(AsyncResult result);

  /**
   * Returns the #GAppInfo that is registered as the default
   * application to handle the file specified by file.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object, %NULL to ignore
   * Returns: a #GAppInfo if the handle was found,
   *   %NULL if there were errors.
   *   When you are done with it, release it with [GObject.ObjectG.unref]
   */
  AppInfo queryDefaultHandler(Cancellable cancellable);

  /**
   * Async version of [Gio.File.queryDefaultHandler].
   * Params:
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call when the request is done
   */
  void queryDefaultHandlerAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes a [Gio.File.queryDefaultHandlerAsync] operation.
   * Params:
   *   result = a #GAsyncResult
   * Returns: a #GAppInfo if the handle was found,
   *   %NULL if there were errors.
   *   When you are done with it, release it with [GObject.ObjectG.unref]
   */
  AppInfo queryDefaultHandlerFinish(AsyncResult result);

  /**
   * Utility function to check if a particular file exists. This is
   * implemented using [Gio.File.queryInfo] and as such does blocking I/O.
   * Note that in many cases it is [racy to first check for file existence](https://en.wikipedia.org/wiki/Time_of_check_to_time_of_use)
   * and then execute something based on the outcome of that, because the
   * file might have been created or removed in between the operations. The
   * general approach to handling that is to not check, but just do the
   * operation and handle the errors as they come.
   * As an example of race-free checking, take the case of reading a file,
   * and if it doesn't exist, creating it. There are two racy versions: read
   * it, and on error create it; and: check if it exists, if not create it.
   * These can both result in two processes creating the file $(LPAREN)with perhaps
   * a partially written file as the result$(RPAREN). The correct approach is to
   * always try to create the file with [Gio.File.create] which will either
   * atomically create the file or fail with a %G_IO_ERROR_EXISTS error.
   * However, in many cases an existence check is useful in a user interface,
   * for instance to make a menu item sensitive/insensitive, so that you don't
   * have to fool users that something is possible and then just show an error
   * dialog. If you do this, you should make sure to also handle the errors
   * that can happen due to races when you execute the operation.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the file exists $(LPAREN)and can be detected without error$(RPAREN),
   *   %FALSE otherwise $(LPAREN)or if cancelled$(RPAREN).
   */
  bool queryExists(Cancellable cancellable);

  /**
   * Utility function to inspect the #GFileType of a file. This is
   * implemented using [Gio.File.queryInfo] and as such does blocking I/O.
   * The primary use case of this method is to check if a file is
   * a regular file, directory, or symlink.
   * Params:
   *   flags = a set of #GFileQueryInfoFlags passed to [Gio.File.queryInfo]
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: The #GFileType of the file and %G_FILE_TYPE_UNKNOWN
   *   if the file does not exist
   */
  FileType queryFileType(FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Similar to [Gio.File.queryInfo], but obtains information
   * about the filesystem the file is on, rather than the file itself.
   * For instance the amount of space available and the type of
   * the filesystem.
   * The attributes value is a string that specifies the attributes
   * that should be gathered. It is not an error if it's not possible
   * to read a particular requested attribute from a file - it just
   * won't be set. attributes should be a comma-separated list of
   * attributes or attribute wildcards. The wildcard "*" means all
   * attributes, and a wildcard like "filesystem::*" means all attributes
   * in the filesystem namespace. The standard namespace for filesystem
   * attributes is "filesystem". Common attributes of interest are
   * %G_FILE_ATTRIBUTE_FILESYSTEM_SIZE $(LPAREN)the total size of the filesystem
   * in bytes$(RPAREN), %G_FILE_ATTRIBUTE_FILESYSTEM_FREE $(LPAREN)number of bytes available$(RPAREN),
   * and %G_FILE_ATTRIBUTE_FILESYSTEM_TYPE $(LPAREN)type of the filesystem$(RPAREN).
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will
   * be returned. Other errors are possible too, and depend on what
   * kind of filesystem the file is on.
   * Params:
   *   attributes = an attribute query string
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileInfo or %NULL if there was an error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileInfo queryFilesystemInfo(string attributes, Cancellable cancellable);

  /**
   * Asynchronously gets the requested information about the filesystem
   * that the specified file is on. The result is a #GFileInfo object
   * that contains key-value attributes $(LPAREN)such as type or size for the
   * file$(RPAREN).
   * For more details, see [Gio.File.queryFilesystemInfo] which is the
   * synchronous version of this call.
   * When the operation is finished, callback will be called. You can
   * then call [Gio.File.queryInfoFinish] to get the result of the
   * operation.
   * Params:
   *   attributes = an attribute query string
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void queryFilesystemInfoAsync(string attributes, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous filesystem info query.
   * See [Gio.File.queryFilesystemInfoAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: #GFileInfo for given file
   *   or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileInfo queryFilesystemInfoFinish(AsyncResult res);

  /**
   * Gets the requested information about specified file.
   * The result is a #GFileInfo object that contains key-value
   * attributes $(LPAREN)such as the type or size of the file$(RPAREN).
   * The attributes value is a string that specifies the file
   * attributes that should be gathered. It is not an error if
   * it's not possible to read a particular requested attribute
   * from a file - it just won't be set. attributes should be a
   * comma-separated list of attributes or attribute wildcards.
   * The wildcard "*" means all attributes, and a wildcard like
   * "standard::*" means all attributes in the standard namespace.
   * An example attribute query be "standard::*,owner::user".
   * The standard attributes are available as defines, like
   * %G_FILE_ATTRIBUTE_STANDARD_NAME.
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * For symlinks, normally the information about the target of the
   * symlink is returned, rather than information about the symlink
   * itself. However if you pass %G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS
   * in flags the information about the symlink itself will be returned.
   * Also, for symlinks that point to non-existing files the information
   * about the symlink itself will be returned.
   * If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will be
   * returned. Other errors are possible too, and depend on what kind of
   * filesystem the file is on.
   * Params:
   *   attributes = an attribute query string
   *   flags = a set of #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileInfo for the given file, or %NULL
   *   on error. Free the returned object with [GObject.ObjectG.unref].
   */
  FileInfo queryInfo(string attributes, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Asynchronously gets the requested information about specified file.
   * The result is a #GFileInfo object that contains key-value attributes
   * $(LPAREN)such as type or size for the file$(RPAREN).
   * For more details, see [Gio.File.queryInfo] which is the synchronous
   * version of this call.
   * When the operation is finished, callback will be called. You can
   * then call [Gio.File.queryInfoFinish] to get the result of the operation.
   * Params:
   *   attributes = an attribute query string
   *   flags = a set of #GFileQueryInfoFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void queryInfoAsync(string attributes, FileQueryInfoFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file info query.
   * See [Gio.File.queryInfoAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: #GFileInfo for given file
   *   or %NULL on error. Free the returned object with
   *   [GObject.ObjectG.unref].
   */
  FileInfo queryInfoFinish(AsyncResult res);

  /**
   * Obtain the list of settable attributes for the file.
   * Returns the type and full attribute name of all the attributes
   * that can be set on this file. This doesn't mean setting it will
   * always succeed though, you might get an access failure, or some
   * specific file may not support a specific attribute.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileAttributeInfoList describing the settable attributes.
   *   When you are done with it, release it with
   *   [Gio.FileAttributeInfoList.unref]
   */
  FileAttributeInfoList querySettableAttributes(Cancellable cancellable);

  /**
   * Obtain the list of attribute namespaces where new attributes
   * can be created by a user. An example of this is extended
   * attributes $(LPAREN)in the "xattr" namespace$(RPAREN).
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileAttributeInfoList describing the writable namespaces.
   *   When you are done with it, release it with
   *   [Gio.FileAttributeInfoList.unref]
   */
  FileAttributeInfoList queryWritableNamespaces(Cancellable cancellable);

  /**
   * Opens a file for reading. The result is a #GFileInputStream that
   * can be used to read the contents of the file.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * If the file does not exist, the %G_IO_ERROR_NOT_FOUND error will be
   * returned. If the file is a directory, the %G_IO_ERROR_IS_DIRECTORY
   * error will be returned. Other errors are possible too, and depend
   * on what kind of filesystem the file is on.
   * Params:
   *   cancellable = a #GCancellable
   * Returns: #GFileInputStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileInputStream read(Cancellable cancellable);

  /**
   * Asynchronously opens file for reading.
   * For more details, see [Gio.File.read] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.readFinish] to get the result
   * of the operation.
   * Params:
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void readAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file read operation started with
   * [Gio.File.readAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFileInputStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileInputStream readFinish(AsyncResult res);

  /**
   * Returns an output stream for overwriting the file, possibly
   * creating a backup copy of the file first. If the file doesn't exist,
   * it will be created.
   * This will try to replace the file in the safest way possible so
   * that any errors during the writing will not affect an already
   * existing copy of the file. For instance, for local files it
   * may write to a temporary file and then atomically rename over
   * the destination when the stream is closed.
   * By default files created are generally readable by everyone,
   * but if you pass %G_FILE_CREATE_PRIVATE in flags the file
   * will be made readable only to the current user, to the level that
   * is supported on the target filesystem.
   * If cancellable is not %NULL, then the operation can be cancelled
   * by triggering the cancellable object from another thread. If the
   * operation was cancelled, the error %G_IO_ERROR_CANCELLED will be
   * returned.
   * If you pass in a non-%NULL etag value and file already exists, then
   * this value is compared to the current entity tag of the file, and if
   * they differ an %G_IO_ERROR_WRONG_ETAG error is returned. This
   * generally means that the file has been changed since you last read
   * it. You can get the new etag from [Gio.FileOutputStream.getEtag]
   * after you've finished writing and closed the #GFileOutputStream. When
   * you load a new file you can use [Gio.FileInputStream.queryInfo] to
   * get the etag of the file.
   * If make_backup is %TRUE, this function will attempt to make a
   * backup of the current file before overwriting it. If this fails
   * a %G_IO_ERROR_CANT_CREATE_BACKUP error will be returned. If you
   * want to replace anyway, try again with make_backup set to %FALSE.
   * If the file is a directory the %G_IO_ERROR_IS_DIRECTORY error will
   * be returned, and if the file is some other form of non-regular file
   * then a %G_IO_ERROR_NOT_REGULAR_FILE error will be returned. Some
   * file systems don't allow all file names, and may return an
   * %G_IO_ERROR_INVALID_FILENAME error, and if the name is to long
   * %G_IO_ERROR_FILENAME_TOO_LONG will be returned. Other errors are
   * possible too, and depend on what kind of filesystem the file is on.
   * Params:
   *   etag = an optional [entity tag](#entity-tags)
   *     for the current #GFile, or #NULL to ignore
   *   makeBackup = %TRUE if a backup should be created
   *   flags = a set of #GFileCreateFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileOutputStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileOutputStream replace(string etag, bool makeBackup, FileCreateFlags flags, Cancellable cancellable);

  /**
   * Asynchronously overwrites the file, replacing the contents,
   * possibly creating a backup copy of the file first.
   * For more details, see [Gio.File.replace] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.replaceFinish] to get the result
   * of the operation.
   * Params:
   *   etag = an [entity tag](#entity-tags) for the current #GFile,
   *     or %NULL to ignore
   *   makeBackup = %TRUE if a backup should be created
   *   flags = a set of #GFileCreateFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void replaceAsync(string etag, bool makeBackup, FileCreateFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Replaces the contents of file with contents of length bytes.
   * If etag is specified $(LPAREN)not %NULL$(RPAREN), any existing file must have that etag,
   * or the error %G_IO_ERROR_WRONG_ETAG will be returned.
   * If make_backup is %TRUE, this function will attempt to make a backup
   * of file. Internally, it uses [Gio.File.replace], so will try to replace the
   * file contents in the safest way possible. For example, atomic renames are
   * used when replacing local files’ contents.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * The returned new_etag can be used to verify that the file hasn't
   * changed the next time it is saved over.
   * Params:
   *   contents = a string containing the new contents for file
   *   etag = the old [entity-tag](#entity-tags) for the document,
   *     or %NULL
   *   makeBackup = %TRUE if a backup should be created
   *   flags = a set of #GFileCreateFlags
   *   newEtag = a location to a new [entity tag](#entity-tags)
   *     for the document. This should be freed with [GLib.Global.gfree] when no longer
   *     needed, or %NULL
   *   cancellable = optional #GCancellable object, %NULL to ignore
   * Returns: %TRUE if successful. If an error has occurred, this function
   *   will return %FALSE and set error appropriately if present.
   */
  bool replaceContents(ubyte[] contents, string etag, bool makeBackup, FileCreateFlags flags, out string newEtag, Cancellable cancellable);

  /**
   * Starts an asynchronous replacement of file with the given
   * contents of length bytes. etag will replace the document's
   * current entity tag.
   * When this operation has completed, callback will be called with
   * user_user data, and the operation can be finalized with
   * [Gio.File.replaceContentsFinish].
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * If make_backup is %TRUE, this function will attempt to
   * make a backup of file.
   * Note that no copy of contents will be made, so it must stay valid
   * until callback is called. See [Gio.File.replaceContentsBytesAsync]
   * for a #GBytes version that will automatically hold a reference to the
   * contents $(LPAREN)without copying$(RPAREN) for the duration of the call.
   * Params:
   *   contents = string of contents to replace the file with
   *   etag = a new [entity tag](#entity-tags) for the file, or %NULL
   *   makeBackup = %TRUE if a backup should be created
   *   flags = a set of #GFileCreateFlags
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call when the request is satisfied
   */
  void replaceContentsAsync(ubyte[] contents, string etag, bool makeBackup, FileCreateFlags flags, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Same as [Gio.File.replaceContentsAsync] but takes a #GBytes input instead.
   * This function will keep a ref on contents until the operation is done.
   * Unlike [Gio.File.replaceContentsAsync] this allows forgetting about the
   * content without waiting for the callback.
   * When this operation has completed, callback will be called with
   * user_user data, and the operation can be finalized with
   * [Gio.File.replaceContentsFinish].
   * Params:
   *   contents = a #GBytes
   *   etag = a new [entity tag](#entity-tags) for the file, or %NULL
   *   makeBackup = %TRUE if a backup should be created
   *   flags = a set of #GFileCreateFlags
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call when the request is satisfied
   */
  void replaceContentsBytesAsync(Bytes contents, string etag, bool makeBackup, FileCreateFlags flags, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous replace of the given file. See
   * [Gio.File.replaceContentsAsync]. Sets new_etag to the new entity
   * tag for the document, if present.
   * Params:
   *   res = a #GAsyncResult
   *   newEtag = a location of a new [entity tag](#entity-tags)
   *     for the document. This should be freed with [GLib.Global.gfree] when it is no
   *     longer needed, or %NULL
   * Returns: %TRUE on success, %FALSE on failure.
   */
  bool replaceContentsFinish(AsyncResult res, out string newEtag);

  /**
   * Finishes an asynchronous file replace operation started with
   * [Gio.File.replaceAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFileOutputStream, or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileOutputStream replaceFinish(AsyncResult res);

  /**
   * Returns an output stream for overwriting the file in readwrite mode,
   * possibly creating a backup copy of the file first. If the file doesn't
   * exist, it will be created.
   * For details about the behaviour, see [Gio.File.replace] which does the
   * same thing but returns an output stream only.
   * Note that in many non-local file cases read and write streams are not
   * supported, so make sure you really need to do read and write streaming,
   * rather than just opening for reading or writing.
   * Params:
   *   etag = an optional [entity tag](#entity-tags)
   *     for the current #GFile, or #NULL to ignore
   *   makeBackup = %TRUE if a backup should be created
   *   flags = a set of #GFileCreateFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFileIOStream or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileIOStream replaceReadwrite(string etag, bool makeBackup, FileCreateFlags flags, Cancellable cancellable);

  /**
   * Asynchronously overwrites the file in read-write mode,
   * replacing the contents, possibly creating a backup copy
   * of the file first.
   * For more details, see [Gio.File.replaceReadwrite] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.replaceReadwriteFinish] to get
   * the result of the operation.
   * Params:
   *   etag = an [entity tag](#entity-tags) for the current #GFile,
   *     or %NULL to ignore
   *   makeBackup = %TRUE if a backup should be created
   *   flags = a set of #GFileCreateFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void replaceReadwriteAsync(string etag, bool makeBackup, FileCreateFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file replace operation started with
   * [Gio.File.replaceReadwriteAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFileIOStream, or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  FileIOStream replaceReadwriteFinish(AsyncResult res);

  /**
   * Resolves a relative path for file to an absolute path.
   * This call does no blocking I/O.
   * If the relative_path is an absolute path name, the resolution
   * is done absolutely $(LPAREN)without taking file path as base$(RPAREN).
   * Params:
   *   relativePath = a given relative path string
   * Returns: a #GFile for the resolved path.
   */
  File resolveRelativePath(string relativePath);

  /**
   * Sets an attribute in the file with attribute name attribute to value_p.
   * Some attributes can be unset by setting type to
   * %G_FILE_ATTRIBUTE_TYPE_INVALID and value_p to %NULL.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   attribute = a string containing the attribute's name
   *   type = The type of the attribute
   *   valueP = a pointer to the value $(LPAREN)or the pointer
   *     itself if the type is a pointer type$(RPAREN)
   *   flags = a set of #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attribute was set, %FALSE otherwise.
   */
  bool setAttribute(string attribute, FileAttributeType type, void* valueP, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Sets attribute of type %G_FILE_ATTRIBUTE_TYPE_BYTE_STRING to value.
   * If attribute is of a different type, this operation will fail,
   * returning %FALSE.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   attribute = a string containing the attribute's name
   *   value = a string containing the attribute's new value
   *   flags = a #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attribute was successfully set to value
   *   in the file, %FALSE otherwise.
   */
  bool setAttributeByteString(string attribute, string value, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Sets attribute of type %G_FILE_ATTRIBUTE_TYPE_INT32 to value.
   * If attribute is of a different type, this operation will fail.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   attribute = a string containing the attribute's name
   *   value = a #gint32 containing the attribute's new value
   *   flags = a #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attribute was successfully set to value
   *   in the file, %FALSE otherwise.
   */
  bool setAttributeInt32(string attribute, int value, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Sets attribute of type %G_FILE_ATTRIBUTE_TYPE_INT64 to value.
   * If attribute is of a different type, this operation will fail.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   attribute = a string containing the attribute's name
   *   value = a #guint64 containing the attribute's new value
   *   flags = a #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attribute was successfully set, %FALSE otherwise.
   */
  bool setAttributeInt64(string attribute, long value, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Sets attribute of type %G_FILE_ATTRIBUTE_TYPE_STRING to value.
   * If attribute is of a different type, this operation will fail.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   attribute = a string containing the attribute's name
   *   value = a string containing the attribute's value
   *   flags = #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attribute was successfully set, %FALSE otherwise.
   */
  bool setAttributeString(string attribute, string value, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Sets attribute of type %G_FILE_ATTRIBUTE_TYPE_UINT32 to value.
   * If attribute is of a different type, this operation will fail.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   attribute = a string containing the attribute's name
   *   value = a #guint32 containing the attribute's new value
   *   flags = a #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attribute was successfully set to value
   *   in the file, %FALSE otherwise.
   */
  bool setAttributeUint32(string attribute, uint value, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Sets attribute of type %G_FILE_ATTRIBUTE_TYPE_UINT64 to value.
   * If attribute is of a different type, this operation will fail.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   attribute = a string containing the attribute's name
   *   value = a #guint64 containing the attribute's new value
   *   flags = a #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE if the attribute was successfully set to value
   *   in the file, %FALSE otherwise.
   */
  bool setAttributeUint64(string attribute, ulong value, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Asynchronously sets the attributes of file with info.
   * For more details, see [Gio.File.setAttributesFromInfo],
   * which is the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.setAttributesFinish] to get
   * the result of the operation.
   * Params:
   *   info = a #GFileInfo
   *   flags = a #GFileQueryInfoFlags
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void setAttributesAsync(FileInfo info, FileQueryInfoFlags flags, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes setting an attribute started in [Gio.File.setAttributesAsync].
   * Params:
   *   result = a #GAsyncResult
   *   info = a #GFileInfo
   * Returns: %TRUE if the attributes were set correctly, %FALSE otherwise.
   */
  bool setAttributesFinish(AsyncResult result, out FileInfo info);

  /**
   * Tries to set all attributes in the #GFileInfo on the target
   * values, not stopping on the first error.
   * If there is any error during this operation then error will
   * be set to the first error. Error on particular fields are flagged
   * by setting the "status" field in the attribute value to
   * %G_FILE_ATTRIBUTE_STATUS_ERROR_SETTING, which means you can
   * also detect further errors.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   info = a #GFileInfo
   *   flags = #GFileQueryInfoFlags
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %FALSE if there was any error, %TRUE otherwise.
   */
  bool setAttributesFromInfo(FileInfo info, FileQueryInfoFlags flags, Cancellable cancellable);

  /**
   * Renames file to the specified display name.
   * The display name is converted from UTF-8 to the correct encoding
   * for the target filesystem if possible and the file is renamed to this.
   * If you want to implement a rename operation in the user interface the
   * edit name $(LPAREN)%G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME$(RPAREN) should be used as the
   * initial value in the rename widget, and then the result after editing
   * should be passed to [Gio.File.setDisplayName].
   * On success the resulting converted filename is returned.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   displayName = a string
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: a #GFile specifying what file was renamed to,
   *   or %NULL if there was an error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File setDisplayName(string displayName, Cancellable cancellable);

  /**
   * Asynchronously sets the display name for a given #GFile.
   * For more details, see [Gio.File.setDisplayName] which is
   * the synchronous version of this call.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.setDisplayNameFinish] to get
   * the result of the operation.
   * Params:
   *   displayName = a string
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void setDisplayNameAsync(string displayName, int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes setting a display name started with
   * [Gio.File.setDisplayNameAsync].
   * Params:
   *   res = a #GAsyncResult
   * Returns: a #GFile or %NULL on error.
   *   Free the returned object with [GObject.ObjectG.unref].
   */
  File setDisplayNameFinish(AsyncResult res);

  /**
   * Starts a file of type %G_FILE_TYPE_MOUNTABLE.
   * Using start_operation, you can request callbacks when, for instance,
   * passwords are needed during authentication.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.mountMountableFinish] to get
   * the result of the operation.
   * Params:
   *   flags = flags affecting the operation
   *   startOperation = a #GMountOperation, or %NULL to avoid user interaction
   *   cancellable = optional #GCancellable object, %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call when the request is satisfied, or %NULL
   */
  void startMountable(DriveStartFlags flags, MountOperation startOperation, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes a start operation. See [Gio.File.startMountable] for details.
   * Finish an asynchronous start operation that was started
   * with [Gio.File.startMountable].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the operation finished successfully. %FALSE
   *   otherwise.
   */
  bool startMountableFinish(AsyncResult result);

  /**
   * Stops a file of type %G_FILE_TYPE_MOUNTABLE.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.stopMountableFinish] to get
   * the result of the operation.
   * Params:
   *   flags = flags affecting the operation
   *   mountOperation = a #GMountOperation,
   *     or %NULL to avoid user interaction.
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied, or %NULL
   */
  void stopMountable(MountUnmountFlags flags, MountOperation mountOperation, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes a stop operation, see [Gio.File.stopMountable] for details.
   * Finish an asynchronous stop operation that was started
   * with [Gio.File.stopMountable].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the operation finished successfully.
   *   %FALSE otherwise.
   */
  bool stopMountableFinish(AsyncResult result);

  /**
   * Checks if file supports
   * [thread-default contexts][g-main-context-push-thread-default-context].
   * If this returns %FALSE, you cannot perform asynchronous operations on
   * file in a thread that has a thread-default context.
   * Returns: Whether or not file supports thread-default contexts.
   */
  bool supportsThreadContexts();

  /**
   * Sends file to the "Trashcan", if possible. This is similar to
   * deleting it, but the user can recover it before emptying the trashcan.
   * Not all file systems support trashing, so this call can return the
   * %G_IO_ERROR_NOT_SUPPORTED error. Since GLib 2.66, the `x-gvfs-notrash` unix
   * mount option can be used to disable [Gio.File.trash] support for certain
   * mounts, the %G_IO_ERROR_NOT_SUPPORTED error will be returned in that case.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * Params:
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   * Returns: %TRUE on successful trash, %FALSE otherwise.
   */
  bool trash(Cancellable cancellable);

  /**
   * Asynchronously sends file to the Trash location, if possible.
   * Params:
   *   ioPriority = the [I/O priority][io-priority] of the request
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback to call
   *     when the request is satisfied
   */
  void trashAsync(int ioPriority, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an asynchronous file trashing operation, started with
   * [Gio.File.trashAsync].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE on successful trash, %FALSE otherwise.
   */
  bool trashFinish(AsyncResult result);

  /**
   * Unmounts a file of type G_FILE_TYPE_MOUNTABLE.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.unmountMountableFinish] to get
   * the result of the operation.
   * Params:
   *   flags = flags affecting the operation
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied

   * Deprecated: Use [Gio.File.unmountMountableWithOperation] instead.
   */
  void unmountMountable(MountUnmountFlags flags, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an unmount operation, see [Gio.File.unmountMountable] for details.
   * Finish an asynchronous unmount operation that was started
   * with [Gio.File.unmountMountable].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the operation finished successfully.
   *   %FALSE otherwise.

   * Deprecated: Use [Gio.File.unmountMountableWithOperationFinish]
   *   instead.
   */
  bool unmountMountableFinish(AsyncResult result);

  /**
   * Unmounts a file of type %G_FILE_TYPE_MOUNTABLE.
   * If cancellable is not %NULL, then the operation can be cancelled by
   * triggering the cancellable object from another thread. If the operation
   * was cancelled, the error %G_IO_ERROR_CANCELLED will be returned.
   * When the operation is finished, callback will be called.
   * You can then call [Gio.File.unmountMountableFinish] to get
   * the result of the operation.
   * Params:
   *   flags = flags affecting the operation
   *   mountOperation = a #GMountOperation,
   *     or %NULL to avoid user interaction
   *   cancellable = optional #GCancellable object,
   *     %NULL to ignore
   *   callback = a #GAsyncReadyCallback
   *     to call when the request is satisfied
   */
  void unmountMountableWithOperation(MountUnmountFlags flags, MountOperation mountOperation, Cancellable cancellable, AsyncReadyCallback callback);

  /**
   * Finishes an unmount operation,
   * see [Gio.File.unmountMountableWithOperation] for details.
   * Finish an asynchronous unmount operation that was started
   * with [Gio.File.unmountMountableWithOperation].
   * Params:
   *   result = a #GAsyncResult
   * Returns: %TRUE if the operation finished successfully.
   *   %FALSE otherwise.
   */
  bool unmountMountableWithOperationFinish(AsyncResult result);
}
