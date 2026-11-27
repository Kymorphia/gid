/// Module for [MappedFile] class
module gid.glib2.mapped_file;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.bytes;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.error;
import gid.glib2.types;
import gid.gobject2.boxed;

/**
    The #GMappedFile represents a file mapping created with
    [gid.glib2.mapped_file.MappedFile.new_]. It has only private members and should
    not be accessed directly.
*/
@gidGir("MappedFile")
class MappedFile : gid.gobject2.boxed.BoxedWrap!(g_mapped_file_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override MappedFile self() nothrow
  {
    return this;
  }

  /**
      Maps a file into memory. On UNIX, this is using the mmap() function.
      
      If writable is true, the mapped buffer may be modified, otherwise
      it is an error to modify the mapped buffer. Modifications to the buffer
      are not visible to other processes mapping the same file, and are not
      written back to the file.
      
      Note that modifications of the underlying file might affect the contents
      of the #GMappedFile. Therefore, mapping should only be used if the file
      will not be modified, or if all modifications of the file are done
      atomically (e.g. using [gid.glib2.global.fileSetContents]).
      
      If filename is the name of an empty, regular file, the function
      will successfully return an empty #GMappedFile. In other cases of
      size 0 (e.g. device files such as /dev/null), error will be set
      to the #GFileError value [gid.glib2.types.FileError.Inval].
  
      Params:
        filename = The path of the file to load, in the GLib
              filename encoding
        writable = whether the mapping should be writable
      Returns: a newly allocated #GMappedFile which must be unref'd
           with [gid.glib2.mapped_file.MappedFile.unref], or null if the mapping failed.
      Throws: [ErrorWrap]
  */
  this(string filename, bool writable)
  {
    GMappedFile* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_mapped_file_new(_filename, writable, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }

  /**
      Maps a file into memory. On UNIX, this is using the mmap() function.
      
      If writable is true, the mapped buffer may be modified, otherwise
      it is an error to modify the mapped buffer. Modifications to the buffer
      are not visible to other processes mapping the same file, and are not
      written back to the file.
      
      Note that modifications of the underlying file might affect the contents
      of the #GMappedFile. Therefore, mapping should only be used if the file
      will not be modified, or if all modifications of the file are done
      atomically (e.g. using [gid.glib2.global.fileSetContents]).
  
      Params:
        fd = The file descriptor of the file to load
        writable = whether the mapping should be writable
      Returns: a newly allocated #GMappedFile which must be unref'd
           with [gid.glib2.mapped_file.MappedFile.unref], or null if the mapping failed.
      Throws: [ErrorWrap]
  */
  static gid.glib2.mapped_file.MappedFile newFromFd(int fd, bool writable)
  {
    GMappedFile* _cretval;
    GError *_err;
    _cretval = g_mapped_file_new_from_fd(fd, writable, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.mapped_file.MappedFile(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GBytes which references the data mapped from file.
      The mapped contents of the file must not be modified after creating this
      bytes object, because a #GBytes should be immutable.
      Returns: A newly allocated #GBytes referencing data
            from file
  */
  gid.glib2.bytes.Bytes getBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = g_mapped_file_get_bytes(cast(GMappedFile*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the contents of a #GMappedFile.
      
      Note that the contents may not be zero-terminated,
      even if the #GMappedFile is backed by a text file.
      
      If the file is empty then null is returned.
      Returns: the contents of file, or null.
  */
  string getContents() nothrow
  {
    char* _cretval;
    _cretval = g_mapped_file_get_contents(cast(GMappedFile*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the length of the contents of a #GMappedFile.
      Returns: the length of the contents of file.
  */
  size_t getLength() nothrow
  {
    size_t _retval;
    _retval = g_mapped_file_get_length(cast(GMappedFile*)this._cPtr);
    return _retval;
  }
}
