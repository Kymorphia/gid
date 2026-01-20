/// Module for [Dir] class
module glib.dir;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;
import gobject.boxed;

/**
    An opaque structure representing an opened directory.
*/
class Dir : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dir_get_type != &gidSymbolNotFound ? g_dir_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Dir self()
  {
    return this;
  }

  /**
      Opens a directory for reading. The names of the files in the
      directory can then be retrieved using [glib.dir.Dir.readName].  Note
      that the ordering is not defined.
  
      Params:
        path = the path to the directory you are interested in. On Unix
                  in the on-disk encoding. On Windows in UTF-8
        flags = Currently must be set to 0. Reserved for future use.
      Returns: a newly allocated #GDir on success, null on failure.
          If non-null, you must free the result with [glib.dir.Dir.close]
          when you are finished with it.
      Throws: [ErrorWrap]
  */
  static glib.dir.Dir open(string path, uint flags)
  {
    GDir* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dir_open(_path, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.dir.Dir(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the name of another entry in the directory, or null.
      The order of entries returned from this function is not defined,
      and may vary by file system or other operating-system dependent
      factors.
      
      null may also be returned in case of errors. On Unix, you can
      check `errno` to find out if null was returned because of an error.
      
      On Unix, the '.' and '..' entries are omitted, and the returned
      name is in the on-disk encoding.
      
      On Windows, as is true of all GLib functions which operate on
      filenames, the returned name is in UTF-8.
      Returns: The entry's name or null if there are no
          more entries. The return value is owned by GLib and
          must not be modified or freed.
  */
  string readName()
  {
    const(char)* _cretval;
    _cretval = g_dir_read_name(cast(GDir*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Resets the given directory. The next call to [glib.dir.Dir.readName]
      will return the first entry again.
  */
  void rewind()
  {
    g_dir_rewind(cast(GDir*)this._cPtr);
  }

  /**
      Creates a subdirectory in the preferred directory for temporary
      files (as returned by [glib.global.getTmpDir]).
      
      tmpl should be a string in the GLib file name encoding containing
      a sequence of six 'X' characters, as the parameter to [glib.global.mkstemp].
      However, unlike these functions, the template should only be a
      basename, no directory components are allowed. If template is
      null, a default template is used.
      
      Note that in contrast to [glib.global.mkdtemp] (and mkdtemp()) tmpl is not
      modified, and might thus be a read-only literal string.
  
      Params:
        tmpl = Template for directory name,
            as in [glib.global.mkdtemp], basename only, or null for a default template
      Returns: The actual name used. This string
          should be freed with [glib.global.gfree] when not needed any longer and is
          is in the GLib file name encoding. In case of errors, null is
          returned and error will be set.
      Throws: [ErrorWrap]
  */
  static string makeTmp(string tmpl = null)
  {
    char* _cretval;
    const(char)* _tmpl = tmpl.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dir_make_tmp(_tmpl, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
