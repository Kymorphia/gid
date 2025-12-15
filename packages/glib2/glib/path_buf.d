/// Module for [PathBuf] class
module glib.path_buf;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    [glib.path_buf.PathBuf] is a helper type that allows you to easily build paths from
    individual elements, using the platform specific conventions for path
    separators.
    
    ```c
    g_auto (GPathBuf) path;
    
    g_path_buf_init (&path);
    
    g_path_buf_push (&path, "usr");
    g_path_buf_push (&path, "bin");
    g_path_buf_push (&path, "echo");
    
    g_autofree char *echo = g_path_buf_to_path (&path);
    g_assert_cmpstr (echo, ==, "/usr/bin/echo");
    ```
    
    You can also load a full path and then operate on its components:
    
    ```c
    g_auto (GPathBuf) path;
    
    g_path_buf_init_from_path (&path, "/usr/bin/echo");
    
    g_path_buf_pop (&path);
    g_path_buf_push (&path, "sh");
    
    g_autofree char *sh = g_path_buf_to_path (&path);
    g_assert_cmpstr (sh, ==, "/usr/bin/sh");
    ```
*/
class PathBuf
{
  GPathBuf cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.path_buf.PathBuf");

    cInstance = *cast(GPathBuf*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Clears the contents of the path buffer.
      
      This function should be use to free the resources in a stack-allocated
      [glib.path_buf.PathBuf] initialized using [glib.path_buf.PathBuf.init_] or
      [glib.path_buf.PathBuf.initFromPath].
  */
  void clear()
  {
    g_path_buf_clear(cast(GPathBuf*)this._cPtr);
  }

  /**
      Clears the contents of the path buffer and returns the built path.
      
      This function returns `NULL` if the [glib.path_buf.PathBuf] is empty.
      
      See also: [glib.path_buf.PathBuf.toPath]
      Returns: the built path
  */
  string clearToPath()
  {
    char* _cretval;
    _cretval = g_path_buf_clear_to_path(cast(GPathBuf*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Frees a [glib.path_buf.PathBuf] allocated by [glib.path_buf.PathBuf.new_], and
      returns the path inside the buffer.
      
      This function returns `NULL` if the [glib.path_buf.PathBuf] is empty.
      
      See also: [glib.path_buf.PathBuf.toPath]
      Returns: the path
  */
  string freeToPath()
  {
    char* _cretval;
    _cretval = g_path_buf_free_to_path(cast(GPathBuf*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Initializes a [glib.path_buf.PathBuf] instance.
      Returns: the initialized path builder
  */
  glib.path_buf.PathBuf init_()
  {
    GPathBuf* _cretval;
    _cretval = g_path_buf_init(cast(GPathBuf*)this._cPtr);
    auto _retval = _cretval ? new glib.path_buf.PathBuf(cast(GPathBuf*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a [glib.path_buf.PathBuf] instance with the given path.
  
      Params:
        path = a file system path
      Returns: the initialized path builder
  */
  glib.path_buf.PathBuf initFromPath(string path = null)
  {
    GPathBuf* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_path_buf_init_from_path(cast(GPathBuf*)this._cPtr, _path);
    auto _retval = _cretval ? new glib.path_buf.PathBuf(cast(GPathBuf*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Removes the last element of the path buffer.
      
      If there is only one element in the path buffer (for example, `/` on
      Unix-like operating systems or the drive on Windows systems), it will
      not be removed and false will be returned instead.
      
      ```c
      GPathBuf buf, cmp;
      
      g_path_buf_init_from_path (&buf, "/bin/sh");
      
      g_path_buf_pop (&buf);
      g_path_buf_init_from_path (&cmp, "/bin");
      g_assert_true (g_path_buf_equal (&buf, &cmp));
      g_path_buf_clear (&cmp);
      
      g_path_buf_pop (&buf);
      g_path_buf_init_from_path (&cmp, "/");
      g_assert_true (g_path_buf_equal (&buf, &cmp));
      g_path_buf_clear (&cmp);
      
      g_path_buf_clear (&buf);
      ```
      Returns: `TRUE` if the buffer was modified and `FALSE` otherwise
  */
  bool pop()
  {
    bool _retval;
    _retval = cast(bool)g_path_buf_pop(cast(GPathBuf*)this._cPtr);
    return _retval;
  }

  /**
      Extends the given path buffer with path.
      
      If path is absolute, it replaces the current path.
      
      If path contains a directory separator, the buffer is extended by
      as many elements the path provides.
      
      On Windows, both forward slashes and backslashes are treated as
      directory separators. On other platforms, `G_DIR_SEPARATOR_S` is the
      only directory separator.
      
      ```c
      GPathBuf buf, cmp;
      
      g_path_buf_init_from_path (&buf, "/tmp");
      g_path_buf_push (&buf, ".X11-unix/X0");
      g_path_buf_init_from_path (&cmp, "/tmp/.X11-unix/X0");
      g_assert_true (g_path_buf_equal (&buf, &cmp));
      g_path_buf_clear (&cmp);
      
      g_path_buf_push (&buf, "/etc/locale.conf");
      g_path_buf_init_from_path (&cmp, "/etc/locale.conf");
      g_assert_true (g_path_buf_equal (&buf, &cmp));
      g_path_buf_clear (&cmp);
      
      g_path_buf_clear (&buf);
      ```
  
      Params:
        path = a path
      Returns: the same pointer to buf, for convenience
  */
  glib.path_buf.PathBuf push(string path)
  {
    GPathBuf* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = g_path_buf_push(cast(GPathBuf*)this._cPtr, _path);
    auto _retval = _cretval ? new glib.path_buf.PathBuf(cast(GPathBuf*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds an extension to the file name in the path buffer.
      
      If extension is `NULL`, the extension will be unset.
      
      If the path buffer does not have a file name set, this function returns
      `FALSE` and leaves the path buffer unmodified.
  
      Params:
        extension = the file extension
      Returns: `TRUE` if the extension was replaced, and `FALSE` otherwise
  */
  bool setExtension(string extension = null)
  {
    bool _retval;
    const(char)* _extension = extension.toCString(No.Alloc);
    _retval = cast(bool)g_path_buf_set_extension(cast(GPathBuf*)this._cPtr, _extension);
    return _retval;
  }

  /**
      Sets the file name of the path.
      
      If the path buffer is empty, the filename is left unset and this
      function returns `FALSE`.
      
      If the path buffer only contains the root element (on Unix-like operating
      systems) or the drive (on Windows), this is the equivalent of pushing
      the new file_name.
      
      If the path buffer contains a path, this is the equivalent of
      popping the path buffer and pushing file_name, creating a
      sibling of the original path.
      
      ```c
      GPathBuf buf, cmp;
      
      g_path_buf_init_from_path (&buf, "/");
      
      g_path_buf_set_filename (&buf, "bar");
      g_path_buf_init_from_path (&cmp, "/bar");
      g_assert_true (g_path_buf_equal (&buf, &cmp));
      g_path_buf_clear (&cmp);
      
      g_path_buf_set_filename (&buf, "baz.txt");
      g_path_buf_init_from_path (&cmp, "/baz.txt");
      g_assert_true (g_path_buf_equal (&buf, &cmp);
      g_path_buf_clear (&cmp);
      
      g_path_buf_clear (&buf);
      ```
  
      Params:
        fileName = the file name in the path
      Returns: `TRUE` if the file name was replaced, and `FALSE` otherwise
  */
  bool setFilename(string fileName)
  {
    bool _retval;
    const(char)* _fileName = fileName.toCString(No.Alloc);
    _retval = cast(bool)g_path_buf_set_filename(cast(GPathBuf*)this._cPtr, _fileName);
    return _retval;
  }

  /**
      Retrieves the built path from the path buffer.
      
      On Windows, the result contains backslashes as directory separators,
      even if forward slashes were used in input.
      
      If the path buffer is empty, this function returns `NULL`.
      Returns: the path
  */
  string toPath()
  {
    char* _cretval;
    _cretval = g_path_buf_to_path(cast(GPathBuf*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Compares two path buffers for equality and returns `TRUE`
      if they are equal.
      
      The path inside the paths buffers are not going to be normalized,
      so `X/Y/Z/A/..`, `X/./Y/Z` and `X/Y/Z` are not going to be considered
      equal.
      
      This function can be passed to [glib.hash_table.HashTable.new_] as the
      `key_equal_func` parameter.
  
      Params:
        v1 = a path buffer to compare
        v2 = a path buffer to compare
      Returns: `TRUE` if the two path buffers are equal,
          and `FALSE` otherwise
  */
  static bool equal(const(void)* v1, const(void)* v2)
  {
    bool _retval;
    _retval = cast(bool)g_path_buf_equal(v1, v2);
    return _retval;
  }
}
