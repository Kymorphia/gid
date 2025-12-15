/// Module for [BookmarkFile] class
module glib.bookmark_file;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.date_time;
import glib.error;
import glib.types;
import gobject.boxed;

/**
    [glib.bookmark_file.BookmarkFile] lets you parse, edit or create files containing bookmarks.
    
    Bookmarks refer to a URI, along with some meta-data about the resource
    pointed by the URI like its MIME type, the application that is registering
    the bookmark and the icon that should be used to represent the bookmark.
    The data is stored using the
    [Desktop Bookmark Specification](http://www.gnome.org/~ebassi/bookmark-spec).
    
    The syntax of the bookmark files is described in detail inside the
    Desktop Bookmark Specification, here is a quick summary: bookmark
    files use a sub-class of the XML Bookmark Exchange Language
    specification, consisting of valid UTF-8 encoded XML, under the
    `<xbel>` root element; each bookmark is stored inside a
    `<bookmark>` element, using its URI: no relative paths can
    be used inside a bookmark file. The bookmark may have a user defined
    title and description, to be used instead of the URI. Under the
    `<metadata>` element, with its owner attribute set to
    `http://freedesktop.org`, is stored the meta-data about a resource
    pointed by its URI. The meta-data consists of the resource's MIME
    type; the applications that have registered a bookmark; the groups
    to which a bookmark belongs to; a visibility flag, used to set the
    bookmark as "private" to the applications and groups that has it
    registered; the URI and MIME type of an icon, to be used when
    displaying the bookmark inside a GUI.
    
    Here is an example of a bookmark file:
    [bookmarks.xbel](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/glib/tests/bookmarks.xbel)
    
    A bookmark file might contain more than one bookmark; each bookmark
    is accessed through its URI.
    
    The important caveat of bookmark files is that when you add a new
    bookmark you must also add the application that is registering it, using
    [glib.bookmark_file.BookmarkFile.addApplication] or [glib.bookmark_file.BookmarkFile.setApplicationInfo].
    If a bookmark has no applications then it won't be dumped when creating
    the on disk representation, using [glib.bookmark_file.BookmarkFile.toData] or
    [glib.bookmark_file.BookmarkFile.toFile].
*/
class BookmarkFile : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_bookmark_file_get_type != &gidSymbolNotFound ? g_bookmark_file_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BookmarkFile self()
  {
    return this;
  }

  /**
      Creates a new empty #GBookmarkFile object.
      
      Use [glib.bookmark_file.BookmarkFile.loadFromFile], [glib.bookmark_file.BookmarkFile.loadFromData]
      or [glib.bookmark_file.BookmarkFile.loadFromDataDirs] to read an existing bookmark
      file.
      Returns: an empty #GBookmarkFile
  */
  this()
  {
    GBookmarkFile* _cretval;
    _cretval = g_bookmark_file_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds the application with name and exec to the list of
      applications that have registered a bookmark for uri into
      bookmark.
      
      Every bookmark inside a #GBookmarkFile must have at least an
      application registered.  Each application must provide a name, a
      command line useful for launching the bookmark, the number of times
      the bookmark has been registered by the application and the last
      time the application registered this bookmark.
      
      If name is null, the name of the application will be the
      same returned by [glib.global.getApplicationName]; if exec is null, the
      command line will be a composition of the program name as
      returned by [glib.global.getPrgname] and the "\`u`" modifier, which will be
      expanded to the bookmark's URI.
      
      This function will automatically take care of updating the
      registrations count and timestamping in case an application
      with the same name had already registered a bookmark for
      uri inside bookmark.
      
      If no bookmark for uri is found, one is created.
  
      Params:
        uri = a valid URI
        name = the name of the application registering the bookmark
            or null
        exec = command line to be used to launch the bookmark or null
  */
  void addApplication(string uri, string name = null, string exec = null)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _exec = exec.toCString(No.Alloc);
    g_bookmark_file_add_application(cast(GBookmarkFile*)this._cPtr, _uri, _name, _exec);
  }

  /**
      Adds group to the list of groups to which the bookmark for uri
      belongs to.
      
      If no bookmark for uri is found then it is created.
  
      Params:
        uri = a valid URI
        group = the group name to be added
  */
  void addGroup(string uri, string group)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _group = group.toCString(No.Alloc);
    g_bookmark_file_add_group(cast(GBookmarkFile*)this._cPtr, _uri, _group);
  }

  /**
      Deeply copies a bookmark #GBookmarkFile object to a new one.
      Returns: the copy of bookmark. Use
          g_bookmark_free() when finished using it.
  */
  glib.bookmark_file.BookmarkFile copy()
  {
    GBookmarkFile* _cretval;
    _cretval = g_bookmark_file_copy(cast(GBookmarkFile*)this._cPtr);
    auto _retval = _cretval ? new glib.bookmark_file.BookmarkFile(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the time the bookmark for uri was added to bookmark
      
      In the event the URI cannot be found, -1 is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a timestamp
      Throws: [BookmarkFileException]
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.getAddedDateTime] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  long getAdded(string uri)
  {
    long _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = g_bookmark_file_get_added(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Gets the time the bookmark for uri was added to bookmark
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a #GDateTime
      Throws: [BookmarkFileException]
  */
  glib.date_time.DateTime getAddedDateTime(string uri)
  {
    GDateTime* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_added_date_time(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the registration information of app_name for the bookmark for
      uri.  See [glib.bookmark_file.BookmarkFile.setApplicationInfo] for more information about
      the returned data.
      
      The string returned in app_exec must be freed.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.  In the
      event that no application with name app_name has registered a bookmark
      for uri,  false is returned and error is set to
      `G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED`. In the event that unquoting
      the command line fails, an error of the `G_SHELL_ERROR` domain is
      set and false is returned.
  
      Params:
        uri = a valid URI
        name = an application's name
        exec = return location for the command line of the application, or null
        count = return location for the registration count, or null
        stamp = return location for the last registration time, or null
      Returns: true on success.
      Throws: [BookmarkFileException]
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.getApplicationInfo] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  bool getAppInfo(string uri, string name, out string exec, out uint count, out long stamp)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    char* _exec;
    GError *_err;
    _retval = cast(bool)g_bookmark_file_get_app_info(cast(GBookmarkFile*)this._cPtr, _uri, _name, &_exec, cast(uint*)&count, cast(long*)&stamp, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    exec = _exec.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the registration information of app_name for the bookmark for
      uri.  See [glib.bookmark_file.BookmarkFile.setApplicationInfo] for more information about
      the returned data.
      
      The string returned in app_exec must be freed.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.  In the
      event that no application with name app_name has registered a bookmark
      for uri,  false is returned and error is set to
      `G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED`. In the event that unquoting
      the command line fails, an error of the `G_SHELL_ERROR` domain is
      set and false is returned.
  
      Params:
        uri = a valid URI
        name = an application's name
        exec = return location for the command line of the application, or null
        count = return location for the registration count, or null
        stamp = return location for the last registration time, or null
      Returns: true on success.
      Throws: [BookmarkFileException]
  */
  bool getApplicationInfo(string uri, string name, out string exec, out uint count, out glib.date_time.DateTime stamp)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    char* _exec;
    GDateTime* _stamp;
    GError *_err;
    _retval = cast(bool)g_bookmark_file_get_application_info(cast(GBookmarkFile*)this._cPtr, _uri, _name, &_exec, cast(uint*)&count, &_stamp, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    exec = _exec.fromCString(Yes.Free);
    stamp = new glib.date_time.DateTime(cast(void*)_stamp, No.Take);
    return _retval;
  }

  /**
      Retrieves the names of the applications that have registered the
      bookmark for uri.
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a newly allocated null-terminated array of strings.
          Use [glib.global.strfreev] to free it.
      Throws: [BookmarkFileException]
  */
  string[] getApplications(string uri)
  {
    char** _cretval;
    size_t _cretlength;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_applications(cast(GBookmarkFile*)this._cPtr, _uri, &_cretlength, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Retrieves the description of the bookmark for uri.
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a newly allocated string or null if the specified
          URI cannot be found.
      Throws: [BookmarkFileException]
  */
  string getDescription(string uri)
  {
    char* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_description(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the list of group names of the bookmark for uri.
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
      
      The returned array is null terminated, so length may optionally
      be null.
  
      Params:
        uri = a valid URI
      Returns: a newly allocated null-terminated array of group names.
          Use [glib.global.strfreev] to free it.
      Throws: [BookmarkFileException]
  */
  string[] getGroups(string uri)
  {
    char** _cretval;
    size_t _cretlength;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_groups(cast(GBookmarkFile*)this._cPtr, _uri, &_cretlength, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the icon of the bookmark for uri.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
        href = return location for the icon's location or null
        mimeType = return location for the icon's MIME type or null
      Returns: true if the icon for the bookmark for the URI was found.
          You should free the returned strings.
      Throws: [BookmarkFileException]
  */
  bool getIcon(string uri, out string href, out string mimeType)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    char* _href;
    char* _mimeType;
    GError *_err;
    _retval = cast(bool)g_bookmark_file_get_icon(cast(GBookmarkFile*)this._cPtr, _uri, &_href, &_mimeType, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    href = _href.fromCString(Yes.Free);
    mimeType = _mimeType.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets whether the private flag of the bookmark for uri is set.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.  In the
      event that the private flag cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        uri = a valid URI
      Returns: true if the private flag is set, false otherwise.
      Throws: [BookmarkFileException]
  */
  bool getIsPrivate(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_get_is_private(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Retrieves the MIME type of the resource pointed by uri.
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.  In the
      event that the MIME type cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        uri = a valid URI
      Returns: a newly allocated string or null if the specified
          URI cannot be found.
      Throws: [BookmarkFileException]
  */
  string getMimeType(string uri)
  {
    char* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_mime_type(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the time when the bookmark for uri was last modified.
      
      In the event the URI cannot be found, -1 is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a timestamp
      Throws: [BookmarkFileException]
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.getModifiedDateTime] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  long getModified(string uri)
  {
    long _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = g_bookmark_file_get_modified(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Gets the time when the bookmark for uri was last modified.
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a #GDateTime
      Throws: [BookmarkFileException]
  */
  glib.date_time.DateTime getModifiedDateTime(string uri)
  {
    GDateTime* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_modified_date_time(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the number of bookmarks inside bookmark.
      Returns: the number of bookmarks
  */
  int getSize()
  {
    int _retval;
    _retval = g_bookmark_file_get_size(cast(GBookmarkFile*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title of the bookmark for uri.
      
      If uri is null, the title of bookmark is returned.
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI or null
      Returns: a newly allocated string or null if the specified
          URI cannot be found.
      Throws: [BookmarkFileException]
  */
  string getTitle(string uri = null)
  {
    char* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_title(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns all URIs of the bookmarks in the bookmark file bookmark.
      The array of returned URIs will be null-terminated, so length may
      optionally be null.
      Returns: a newly allocated null-terminated array of strings.
          Use [glib.global.strfreev] to free it.
  */
  string[] getUris()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = g_bookmark_file_get_uris(cast(GBookmarkFile*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the time the bookmark for uri was last visited.
      
      In the event the URI cannot be found, -1 is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a timestamp.
      Throws: [BookmarkFileException]
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.getVisitedDateTime] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  long getVisited(string uri)
  {
    long _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = g_bookmark_file_get_visited(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Gets the time the bookmark for uri was last visited.
      
      In the event the URI cannot be found, null is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
      Returns: a #GDateTime
      Throws: [BookmarkFileException]
  */
  glib.date_time.DateTime getVisitedDateTime(string uri)
  {
    GDateTime* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_bookmark_file_get_visited_date_time(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks whether the bookmark for uri inside bookmark has been
      registered by application name.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
        name = the name of the application
      Returns: true if the application name was found
      Throws: [BookmarkFileException]
  */
  bool hasApplication(string uri, string name)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_has_application(cast(GBookmarkFile*)this._cPtr, _uri, _name, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Checks whether group appears in the list of groups to which
      the bookmark for uri belongs to.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        uri = a valid URI
        group = the group name to be searched
      Returns: true if group was found.
      Throws: [BookmarkFileException]
  */
  bool hasGroup(string uri, string group)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _group = group.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_has_group(cast(GBookmarkFile*)this._cPtr, _uri, _group, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Looks whether the desktop bookmark has an item with its URI set to uri.
  
      Params:
        uri = a valid URI
      Returns: true if uri is inside bookmark, false otherwise
  */
  bool hasItem(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = cast(bool)g_bookmark_file_has_item(cast(GBookmarkFile*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Loads a bookmark file from memory into an empty #GBookmarkFile
      structure.  If the object cannot be created then error is set to a
      #GBookmarkFileError.
  
      Params:
        data = desktop bookmarks
             loaded in memory
      Returns: true if a desktop bookmark could be loaded.
      Throws: [BookmarkFileException]
  */
  bool loadFromData(ubyte[] data)
  {
    bool _retval;
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = cast(bool)g_bookmark_file_load_from_data(cast(GBookmarkFile*)this._cPtr, _data, _length, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      This function looks for a desktop bookmark file named file in the
      paths returned from [glib.global.getUserDataDir] and [glib.global.getSystemDataDirs],
      loads the file into bookmark and returns the file's full path in
      full_path.  If the file could not be loaded then error is
      set to either a #GFileError or #GBookmarkFileError.
  
      Params:
        file = a relative path to a filename to open and parse
        fullPath = return location for a string
             containing the full path of the file, or null
      Returns: true if a key file could be loaded, false otherwise
      Throws: [BookmarkFileException]
  */
  bool loadFromDataDirs(string file, out string fullPath)
  {
    bool _retval;
    const(char)* _file = file.toCString(No.Alloc);
    char* _fullPath;
    GError *_err;
    _retval = cast(bool)g_bookmark_file_load_from_data_dirs(cast(GBookmarkFile*)this._cPtr, _file, &_fullPath, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    fullPath = _fullPath.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Loads a desktop bookmark file into an empty #GBookmarkFile structure.
      If the file could not be loaded then error is set to either a #GFileError
      or #GBookmarkFileError.
  
      Params:
        filename = the path of a filename to load, in the
              GLib file name encoding
      Returns: true if a desktop bookmark file could be loaded
      Throws: [BookmarkFileException]
  */
  bool loadFromFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_load_from_file(cast(GBookmarkFile*)this._cPtr, _filename, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Changes the URI of a bookmark item from old_uri to new_uri.  Any
      existing bookmark for new_uri will be overwritten.  If new_uri is
      null, then the bookmark is removed.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
  
      Params:
        oldUri = a valid URI
        newUri = a valid URI, or null
      Returns: true if the URI was successfully changed
      Throws: [BookmarkFileException]
  */
  bool moveItem(string oldUri, string newUri = null)
  {
    bool _retval;
    const(char)* _oldUri = oldUri.toCString(No.Alloc);
    const(char)* _newUri = newUri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_move_item(cast(GBookmarkFile*)this._cPtr, _oldUri, _newUri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Removes application registered with name from the list of applications
      that have registered a bookmark for uri inside bookmark.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
      In the event that no application with name app_name has registered
      a bookmark for uri,  false is returned and error is set to
      `G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED`.
  
      Params:
        uri = a valid URI
        name = the name of the application
      Returns: true if the application was successfully removed.
      Throws: [BookmarkFileException]
  */
  bool removeApplication(string uri, string name)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_remove_application(cast(GBookmarkFile*)this._cPtr, _uri, _name, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Removes group from the list of groups to which the bookmark
      for uri belongs to.
      
      In the event the URI cannot be found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`.
      In the event no group was defined, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_INVALID_VALUE`.
  
      Params:
        uri = a valid URI
        group = the group name to be removed
      Returns: true if group was successfully removed.
      Throws: [BookmarkFileException]
  */
  bool removeGroup(string uri, string group)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _group = group.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_remove_group(cast(GBookmarkFile*)this._cPtr, _uri, _group, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Removes the bookmark for uri from the bookmark file bookmark.
  
      Params:
        uri = a valid URI
      Returns: true if the bookmark was removed successfully.
      Throws: [BookmarkFileException]
  */
  bool removeItem(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_remove_item(cast(GBookmarkFile*)this._cPtr, _uri, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Sets the time the bookmark for uri was added into bookmark.
      
      If no bookmark for uri is found then it is created.
  
      Params:
        uri = a valid URI
        added = a timestamp or -1 to use the current time
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.setAddedDateTime] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  void setAdded(string uri, long added)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    g_bookmark_file_set_added(cast(GBookmarkFile*)this._cPtr, _uri, added);
  }

  /**
      Sets the time the bookmark for uri was added into bookmark.
      
      If no bookmark for uri is found then it is created.
  
      Params:
        uri = a valid URI
        added = a #GDateTime
  */
  void setAddedDateTime(string uri, glib.date_time.DateTime added)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    g_bookmark_file_set_added_date_time(cast(GBookmarkFile*)this._cPtr, _uri, added ? cast(GDateTime*)added._cPtr(No.Dup) : null);
  }

  /**
      Sets the meta-data of application name inside the list of
      applications that have registered a bookmark for uri inside
      bookmark.
      
      You should rarely use this function; use [glib.bookmark_file.BookmarkFile.addApplication]
      and [glib.bookmark_file.BookmarkFile.removeApplication] instead.
      
      name can be any UTF-8 encoded string used to identify an
      application.
      exec can have one of these two modifiers: "\`f`", which will
      be expanded as the local file name retrieved from the bookmark's
      URI; "\`u`", which will be expanded as the bookmark's URI.
      The expansion is done automatically when retrieving the stored
      command line using the [glib.bookmark_file.BookmarkFile.getApplicationInfo] function.
      count is the number of times the application has registered the
      bookmark; if is < 0, the current registration count will be increased
      by one, if is 0, the application with name will be removed from
      the list of registered applications.
      stamp is the Unix time of the last registration; if it is -1, the
      current time will be used.
      
      If you try to remove an application by setting its registration count to
      zero, and no bookmark for uri is found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`; similarly,
      in the event that no application name has registered a bookmark
      for uri,  false is returned and error is set to
      `G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED`.  Otherwise, if no bookmark
      for uri is found, one is created.
  
      Params:
        uri = a valid URI
        name = an application's name
        exec = an application's command line
        count = the number of registrations done for this application
        stamp = the time of the last registration for this application
      Returns: true if the application's meta-data was successfully
          changed.
      Throws: [BookmarkFileException]
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.setApplicationInfo] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  bool setAppInfo(string uri, string name, string exec, int count, long stamp)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _exec = exec.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_set_app_info(cast(GBookmarkFile*)this._cPtr, _uri, _name, _exec, count, stamp, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Sets the meta-data of application name inside the list of
      applications that have registered a bookmark for uri inside
      bookmark.
      
      You should rarely use this function; use [glib.bookmark_file.BookmarkFile.addApplication]
      and [glib.bookmark_file.BookmarkFile.removeApplication] instead.
      
      name can be any UTF-8 encoded string used to identify an
      application.
      exec can have one of these two modifiers: "\`f`", which will
      be expanded as the local file name retrieved from the bookmark's
      URI; "\`u`", which will be expanded as the bookmark's URI.
      The expansion is done automatically when retrieving the stored
      command line using the [glib.bookmark_file.BookmarkFile.getApplicationInfo] function.
      count is the number of times the application has registered the
      bookmark; if is < 0, the current registration count will be increased
      by one, if is 0, the application with name will be removed from
      the list of registered applications.
      stamp is the Unix time of the last registration.
      
      If you try to remove an application by setting its registration count to
      zero, and no bookmark for uri is found, false is returned and
      error is set to `G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND`; similarly,
      in the event that no application name has registered a bookmark
      for uri,  false is returned and error is set to
      `G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED`.  Otherwise, if no bookmark
      for uri is found, one is created.
  
      Params:
        uri = a valid URI
        name = an application's name
        exec = an application's command line
        count = the number of registrations done for this application
        stamp = the time of the last registration for this application,
             which may be null if count is 0
      Returns: true if the application's meta-data was successfully
          changed.
      Throws: [BookmarkFileException]
  */
  bool setApplicationInfo(string uri, string name, string exec, int count, glib.date_time.DateTime stamp = null)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _exec = exec.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_set_application_info(cast(GBookmarkFile*)this._cPtr, _uri, _name, _exec, count, stamp ? cast(GDateTime*)stamp._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /**
      Sets description as the description of the bookmark for uri.
      
      If uri is null, the description of bookmark is set.
      
      If a bookmark for uri cannot be found then it is created.
  
      Params:
        uri = a valid URI or null
        description = a string
  */
  void setDescription(string uri, string description)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    g_bookmark_file_set_description(cast(GBookmarkFile*)this._cPtr, _uri, _description);
  }

  /**
      Sets a list of group names for the item with URI uri.  Each previously
      set group name list is removed.
      
      If uri cannot be found then an item for it is created.
  
      Params:
        uri = an item's URI
        groups = an array of
             group names, or null to remove all groups
  */
  void setGroups(string uri, string[] groups = null)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    size_t _length;
    if (groups)
      _length = cast(size_t)groups.length;

    const(char)*[] _tmpgroups;
    foreach (s; groups)
      _tmpgroups ~= s.toCString(No.Alloc);
    const(char*)* _groups = _tmpgroups.ptr;
    g_bookmark_file_set_groups(cast(GBookmarkFile*)this._cPtr, _uri, _groups, _length);
  }

  /**
      Sets the icon for the bookmark for uri. If href is null, unsets
      the currently set icon. href can either be a full URL for the icon
      file or the icon name following the Icon Naming specification.
      
      If no bookmark for uri is found one is created.
  
      Params:
        uri = a valid URI
        href = the URI of the icon for the bookmark, or null
        mimeType = the MIME type of the icon for the bookmark
  */
  void setIcon(string uri, string href, string mimeType)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _href = href.toCString(No.Alloc);
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    g_bookmark_file_set_icon(cast(GBookmarkFile*)this._cPtr, _uri, _href, _mimeType);
  }

  /**
      Sets the private flag of the bookmark for uri.
      
      If a bookmark for uri cannot be found then it is created.
  
      Params:
        uri = a valid URI
        isPrivate = true if the bookmark should be marked as private
  */
  void setIsPrivate(string uri, bool isPrivate)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    g_bookmark_file_set_is_private(cast(GBookmarkFile*)this._cPtr, _uri, isPrivate);
  }

  /**
      Sets mime_type as the MIME type of the bookmark for uri.
      
      If a bookmark for uri cannot be found then it is created.
  
      Params:
        uri = a valid URI
        mimeType = a MIME type
  */
  void setMimeType(string uri, string mimeType)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    g_bookmark_file_set_mime_type(cast(GBookmarkFile*)this._cPtr, _uri, _mimeType);
  }

  /**
      Sets the last time the bookmark for uri was last modified.
      
      If no bookmark for uri is found then it is created.
      
      The "modified" time should only be set when the bookmark's meta-data
      was actually changed.  Every function of #GBookmarkFile that
      modifies a bookmark also changes the modification time, except for
      [glib.bookmark_file.BookmarkFile.setVisitedDateTime].
  
      Params:
        uri = a valid URI
        modified = a timestamp or -1 to use the current time
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.setModifiedDateTime] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  void setModified(string uri, long modified)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    g_bookmark_file_set_modified(cast(GBookmarkFile*)this._cPtr, _uri, modified);
  }

  /**
      Sets the last time the bookmark for uri was last modified.
      
      If no bookmark for uri is found then it is created.
      
      The "modified" time should only be set when the bookmark's meta-data
      was actually changed.  Every function of #GBookmarkFile that
      modifies a bookmark also changes the modification time, except for
      [glib.bookmark_file.BookmarkFile.setVisitedDateTime].
  
      Params:
        uri = a valid URI
        modified = a #GDateTime
  */
  void setModifiedDateTime(string uri, glib.date_time.DateTime modified)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    g_bookmark_file_set_modified_date_time(cast(GBookmarkFile*)this._cPtr, _uri, modified ? cast(GDateTime*)modified._cPtr(No.Dup) : null);
  }

  /**
      Sets title as the title of the bookmark for uri inside the
      bookmark file bookmark.
      
      If uri is null, the title of bookmark is set.
      
      If a bookmark for uri cannot be found then it is created.
  
      Params:
        uri = a valid URI or null
        title = a UTF-8 encoded string
  */
  void setTitle(string uri, string title)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _title = title.toCString(No.Alloc);
    g_bookmark_file_set_title(cast(GBookmarkFile*)this._cPtr, _uri, _title);
  }

  /**
      Sets the time the bookmark for uri was last visited.
      
      If no bookmark for uri is found then it is created.
      
      The "visited" time should only be set if the bookmark was launched,
      either using the command line retrieved by [glib.bookmark_file.BookmarkFile.getApplicationInfo]
      or by the default application for the bookmark's MIME type, retrieved
      using [glib.bookmark_file.BookmarkFile.getMimeType].  Changing the "visited" time
      does not affect the "modified" time.
  
      Params:
        uri = a valid URI
        visited = a timestamp or -1 to use the current time
  
      Deprecated: Use [glib.bookmark_file.BookmarkFile.setVisitedDateTime] instead, as
           `time_t` is deprecated due to the year 2038 problem.
  */
  void setVisited(string uri, long visited)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    g_bookmark_file_set_visited(cast(GBookmarkFile*)this._cPtr, _uri, visited);
  }

  /**
      Sets the time the bookmark for uri was last visited.
      
      If no bookmark for uri is found then it is created.
      
      The "visited" time should only be set if the bookmark was launched,
      either using the command line retrieved by [glib.bookmark_file.BookmarkFile.getApplicationInfo]
      or by the default application for the bookmark's MIME type, retrieved
      using [glib.bookmark_file.BookmarkFile.getMimeType].  Changing the "visited" time
      does not affect the "modified" time.
  
      Params:
        uri = a valid URI
        visited = a #GDateTime
  */
  void setVisitedDateTime(string uri, glib.date_time.DateTime visited)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    g_bookmark_file_set_visited_date_time(cast(GBookmarkFile*)this._cPtr, _uri, visited ? cast(GDateTime*)visited._cPtr(No.Dup) : null);
  }

  /**
      This function outputs bookmark as a string.
      Returns: a newly allocated string holding the contents of the #GBookmarkFile
      Throws: [BookmarkFileException]
  */
  ubyte[] toData()
  {
    ubyte* _cretval;
    size_t _cretlength;
    GError *_err;
    _cretval = g_bookmark_file_to_data(cast(GBookmarkFile*)this._cPtr, &_cretlength, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      This function outputs bookmark into a file.  The write process is
      guaranteed to be atomic by using [glib.global.fileSetContents] internally.
  
      Params:
        filename = path of the output file
      Returns: true if the file was successfully written.
      Throws: [BookmarkFileException]
  */
  bool toFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_bookmark_file_to_file(cast(GBookmarkFile*)this._cPtr, _filename, &_err);
    if (_err)
      throw new BookmarkFileException(_err);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = g_bookmark_file_error_quark();
    return _retval;
  }
}

class BookmarkFileException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(glib.bookmark_file.BookmarkFile.errorQuark, cast(int)code, msg);
  }

  alias Code = BookmarkFileError;
}
