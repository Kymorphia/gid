/// Module for [FileSystem] class
module arrow.file_system;

import arrow.c.functions;
import arrow.c.types;
import arrow.file_info;
import arrow.file_selector;
import arrow.input_stream;
import arrow.output_stream;
import arrow.seekable_input_stream;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class FileSystem : gobject.object.ObjectWrap
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
    return cast(void function())garrow_file_system_get_type != &gidSymbolNotFound ? garrow_file_system_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileSystem self()
  {
    return this;
  }

  /**
      This is a factory function to create a specific #GArrowFileSystem
      object.
  
      Params:
        uri = An URI to specify file system with options. If you only have an
            absolute path, [glib.global.filenameToUri] will help you.
      Returns: The newly created file system
          that is an object of a subclass of #GArrowFileSystem.
      Throws: [ErrorWrap]
  */
  static arrow.file_system.FileSystem create(string uri)
  {
    GArrowFileSystem* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_system_create(_uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.file_system.FileSystem)(cast(GArrowFileSystem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Copy a file.
      If the destination exists and is a directory, an error is returned.
      Otherwise, it is replaced.
  
      Params:
        src = The path of the source file.
        dest = The path of the destination.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool copyFile(string src, string dest)
  {
    bool _retval;
    const(char)* _src = src.toCString(No.Alloc);
    const(char)* _dest = dest.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_file_system_copy_file(cast(GArrowFileSystem*)this._cPtr, _src, _dest, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Create a directory and subdirectories.
      This function succeeds if the directory already exists.
  
      Params:
        path = The paths of the directory.
        recursive = Whether creating directory recursively or not.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool createDir(string path, bool recursive)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_file_system_create_dir(cast(GArrowFileSystem*)this._cPtr, _path, recursive, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Delete a directory and its contents, recursively.
  
      Params:
        path = The paths of the directory.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool deleteDir(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_file_system_delete_dir(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Delete a directory's contents, recursively. Like
      [arrow.file_system.FileSystem.deleteDir], but doesn't delete the directory
      itself. Passing an empty path (`""`) will wipe the entire file
      system tree.
  
      Params:
        path = The paths of the directory.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool deleteDirContents(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_file_system_delete_dir_contents(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Delete a file.
  
      Params:
        path = The paths of the file to be delete.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool deleteFile(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_file_system_delete_file(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Delete many files.
  
      Params:
        paths = The paths of the files to be delete.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool deleteFiles(string[] paths)
  {
    bool _retval;
    size_t _nPaths;
    if (paths)
      _nPaths = cast(size_t)paths.length;

    char*[] _tmppaths;
    foreach (s; paths)
      _tmppaths ~= s.toCString(No.Alloc);
    const(char*)* _paths = _tmppaths.ptr;

    GError *_err;
    _retval = cast(bool)garrow_file_system_delete_files(cast(GArrowFileSystem*)this._cPtr, _paths, _nPaths, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Get information for the given target.
      
      Any symlink is automatically dereferenced, recursively.
      A non-existing or unreachable file returns an OK status and has
      a #GArrowFileType of value [arrow.types.FileType.NotFound].
      An error status indicates a truly exceptional condition
      (low-level I/O error, etc.).
  
      Params:
        path = The path of the target.
      Returns: A #GArrowFileInfo.
      Throws: [ErrorWrap]
  */
  arrow.file_info.FileInfo getFileInfo(string path)
  {
    GArrowFileInfo* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_system_get_file_info(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.file_info.FileInfo)(cast(GArrowFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get information same as [arrow.file_system.FileSystem.getFileInfo]
      for the given many targets at once.
  
      Params:
        paths = The paths of the targets.
      Returns: A list of #GArrowFileInfo.
      Throws: [ErrorWrap]
  */
  arrow.file_info.FileInfo[] getFileInfosPaths(string[] paths)
  {
    GList* _cretval;
    size_t _nPaths;
    if (paths)
      _nPaths = cast(size_t)paths.length;

    char*[] _tmppaths;
    foreach (s; paths)
      _tmppaths ~= s.toCString(No.Alloc);
    const(char*)* _paths = _tmppaths.ptr;

    GError *_err;
    _cretval = garrow_file_system_get_file_infos_paths(cast(GArrowFileSystem*)this._cPtr, _paths, _nPaths, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(arrow.file_info.FileInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get information same as [arrow.file_system.FileSystem.getFileInfo]
      according to a selector.
      
      The selector's base directory will not be part of the results,
      even if it exists.
  
      Params:
        fileSelector = A #GArrowFileSelector.
      Returns: A list of #GArrowFileInfo.
      Throws: [ErrorWrap]
  */
  arrow.file_info.FileInfo[] getFileInfosSelector(arrow.file_selector.FileSelector fileSelector)
  {
    GList* _cretval;
    GError *_err;
    _cretval = garrow_file_system_get_file_infos_selector(cast(GArrowFileSystem*)this._cPtr, fileSelector ? cast(GArrowFileSelector*)fileSelector._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(arrow.file_info.FileInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  string getTypeName()
  {
    char* _cretval;
    _cretval = garrow_file_system_get_type_name(cast(GArrowFileSystem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Move / rename a file or a directory.
      If the destination exists:
      $(LIST
        * if it is a non-empty directory, an error is returned
        * otherwise, if it has the same type as the source, it is replaced
        * otherwise, behavior is unspecified (implementation-dependent).
      )
  
      Params:
        src = The path of the source file.
        dest = The path of the destination.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool move(string src, string dest)
  {
    bool _retval;
    const(char)* _src = src.toCString(No.Alloc);
    const(char)* _dest = dest.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_file_system_move(cast(GArrowFileSystem*)this._cPtr, _src, _dest, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Open an output stream for appending.
      If the target doesn't exist, a new empty file is created.
  
      Params:
        path = The path of the output stream.
      Returns: A newly created #GArrowOutputStream
          for appending.
      Throws: [ErrorWrap]
  */
  arrow.output_stream.OutputStream openAppendStream(string path)
  {
    GArrowOutputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_system_open_append_stream(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.output_stream.OutputStream)(cast(GArrowOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Open an input file for random access reading.
  
      Params:
        path = The path of the input file.
      Returns: A newly created
          #GArrowSeekableInputStream.
      Throws: [ErrorWrap]
  */
  arrow.seekable_input_stream.SeekableInputStream openInputFile(string path)
  {
    GArrowSeekableInputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_system_open_input_file(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.seekable_input_stream.SeekableInputStream)(cast(GArrowSeekableInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Open an input stream for sequential reading.
  
      Params:
        path = The path of the input stream.
      Returns: A newly created
          #GArrowInputStream.
      Throws: [ErrorWrap]
  */
  arrow.input_stream.InputStream openInputStream(string path)
  {
    GArrowInputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_system_open_input_stream(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.input_stream.InputStream)(cast(GArrowInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Open an output stream for sequential writing.
      If the target already exists, the existing data is truncated.
  
      Params:
        path = The path of the output stream.
      Returns: A newly created
          #GArrowOutputStream.
      Throws: [ErrorWrap]
  */
  arrow.output_stream.OutputStream openOutputStream(string path)
  {
    GArrowOutputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_system_open_output_stream(cast(GArrowFileSystem*)this._cPtr, _path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.output_stream.OutputStream)(cast(GArrowOutputStream*)_cretval, Yes.Take);
    return _retval;
  }
}
