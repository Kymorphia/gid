/// Module for [FileInfo] class
module gid.gio2.file_info;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.file_attribute_matcher;
import gid.gio2.icon;
import gid.gio2.types;
import gid.glib2.date_time;
import gid.glib2.time_val;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Stores information about a file system object referenced by a [gid.gio2.file.File].
    
    Functionality for manipulating basic metadata for files. [gid.gio2.file_info.FileInfo]
    implements methods for getting information that all files should
    contain, and allows for manipulation of extended attributes.
    
    See the [file attributes](file-attributes.html) document for more
    information on how GIO handles file attributes.
    
    To obtain a [gid.gio2.file_info.FileInfo] for a [gid.gio2.file.File], use
    [gid.gio2.file.File.queryInfo] (or its async variant). To obtain a [gid.gio2.file_info.FileInfo]
    for a file input or output stream, use [gid.gio2.file_input_stream.FileInputStream.queryInfo]
    or [gid.gio2.file_output_stream.FileOutputStream.queryInfo] (or their async variants).
    
    To change the actual attributes of a file, you should then set the
    attribute in the [gid.gio2.file_info.FileInfo] and call [gid.gio2.file.File.setAttributesFromInfo]
    or [gid.gio2.file.File.setAttributesAsync] on a [gid.gio2.file.File].
    
    However, not all attributes can be changed in the file. For instance,
    the actual size of a file cannot be changed via [gid.gio2.file_info.FileInfo.setSize].
    You may call [gid.gio2.file.File.querySettableAttributes] and
    [gid.gio2.file.File.queryWritableNamespaces] to discover the settable attributes
    of a particular file at runtime.
    
    The direct accessors, such as [gid.gio2.file_info.FileInfo.getName], are slightly more
    optimized than the generic attribute accessors, such as
    [gid.gio2.file_info.FileInfo.getAttributeByteString].This optimization will matter
    only if calling the API in a tight loop.
    
    It is an error to call these accessors without specifying their required file
    attributes when creating the [gid.gio2.file_info.FileInfo]. Use
    [gid.gio2.file_info.FileInfo.hasAttribute] or [gid.gio2.file_info.FileInfo.listAttributes]
    to check what attributes are specified for a [gid.gio2.file_info.FileInfo].
    
    [gid.gio2.file_attribute_matcher.FileAttributeMatcher] allows for searching through a [gid.gio2.file_info.FileInfo]
    for attributes.
*/
class FileInfo : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_file_info_get_type != &gidSymbolNotFound ? g_file_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFileInfo";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.file_info.FileInfo]
      Returns: New builder object
  */
  static FileInfoGidBuilder builder() nothrow
  {
    return new FileInfoGidBuilder;
  }

  /**
      Creates a new file info structure.
      Returns: a #GFileInfo.
  */
  this() nothrow
  {
    GFileInfo* _cretval;
    _cretval = g_file_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Clears the status information from info.
  */
  void clearStatus() nothrow
  {
    g_file_info_clear_status(cast(GFileInfo*)this._cPtr);
  }

  /**
      First clears all of the [GFileAttribute](file-attributes.html#file-attributes) of
      dest_info, and then copies all of the file attributes from src_info to dest_info.
  
      Params:
        destInfo = destination to copy attributes to.
  */
  void copyInto(gid.gio2.file_info.FileInfo destInfo) nothrow
  {
    g_file_info_copy_into(cast(GFileInfo*)this._cPtr, destInfo ? cast(GFileInfo*)destInfo._cPtr(No.Dup) : null);
  }

  /**
      Duplicates a file info structure.
      Returns: a duplicate #GFileInfo of other.
  */
  gid.gio2.file_info.FileInfo dup() nothrow
  {
    GFileInfo* _cretval;
    _cretval = g_file_info_dup(cast(GFileInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the access time of the current info and returns it as a
      #GDateTime.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_ACCESS]. If [gid.gio2.types.FILE_ATTRIBUTE_TIME_ACCESS_USEC] is
      provided, the resulting #GDateTime will additionally have microsecond
      precision.
      
      If nanosecond precision is needed, [gid.gio2.types.FILE_ATTRIBUTE_TIME_ACCESS_NSEC] must
      be queried separately using [gid.gio2.file_info.FileInfo.getAttributeUint32].
      Returns: access time, or null if unknown
  */
  gid.glib2.date_time.DateTime getAccessDateTime() nothrow
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_access_date_time(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value of an attribute, formatted as a human readable string.
      
      This escapes things as needed to make the string valid UTF-8 and readable by
      humans. It’s not meant to be a machine readable or reversible escaping
      format.
      
      To format file name attributes of type
      `enumGio.FileAttributeType.BYTE_STRING` for output as UTF-8, use
      `funcGLib.filename_to_utf8` instead:
      ```c
      const char *trash_orig_path_byte_string;
      g_autofree char *trash_orig_path_utf8 = NULL;
      
      trash_orig_path_byte_string = g_file_info_get_attribute_byte_string (info, G_FILE_ATTRIBUTE_TRASH_ORIG_PATH);
      trash_orig_path_utf8 = g_filename_to_utf8 (trash_orig_path_byte_string, -1, NULL, NULL, NULL);
      if (trash_orig_path_utf8 != NULL)
        g_message ("Some larger UTF-8 string with filename embedded as %s", trash_orig_path_utf8);
      ```
  
      Params:
        attribute = a file attribute key.
      Returns: a UTF-8 string associated with the given attribute, or
           null if the attribute wasn’t set.
           When you're done with the string it must be freed with [gid.glib2.global.gfree].
  */
  string getAttributeAsString(string attribute) nothrow
  {
    char* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_as_string(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the value of a boolean attribute. If the attribute does not
      contain a boolean value, false will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: the boolean value contained within the attribute.
  */
  bool getAttributeBoolean(string attribute) nothrow
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_file_info_get_attribute_boolean(cast(GFileInfo*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Gets the value of a byte string attribute. If the attribute does
      not contain a byte string, null will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: the contents of the attribute value as a byte string, or
        null otherwise.
  */
  string getAttributeByteString(string attribute) nothrow
  {
    const(char)* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_byte_string(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the attribute type, value and status for an attribute key.
  
      Params:
        attribute = a file attribute key
        type = return location for the attribute type, or null
        valuePp = return location for the
             attribute value, or null; the attribute value will not be null
        status = return location for the attribute status, or null
      Returns: true if info has an attribute named attribute,
             false otherwise.
  */
  bool getAttributeData(string attribute, out gid.gio2.types.FileAttributeType type, out void* valuePp, out gid.gio2.types.FileAttributeStatus status) nothrow
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_file_info_get_attribute_data(cast(GFileInfo*)this._cPtr, _attribute, &type, cast(void**)&valuePp, &status);
    return _retval;
  }

  /**
      Gets the value of a byte string attribute as a file path.
      
      If the attribute does not contain a byte string, `NULL` will be returned.
      
      This function is meant to be used by language bindings that have specific
      handling for Unix paths.
  
      Params:
        attribute = a file attribute key.
      Returns: the contents of the attribute value as
        a file path, or null otherwise.
  */
  string getAttributeFilePath(string attribute) nothrow
  {
    const(char)* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_file_path(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a signed 32-bit integer contained within the attribute. If the
      attribute does not contain a signed 32-bit integer, or is invalid,
      0 will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: a signed 32-bit integer from the attribute.
  */
  int getAttributeInt32(string attribute) nothrow
  {
    int _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = g_file_info_get_attribute_int32(cast(GFileInfo*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Gets a signed 64-bit integer contained within the attribute. If the
      attribute does not contain a signed 64-bit integer, or is invalid,
      0 will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: a signed 64-bit integer from the attribute.
  */
  long getAttributeInt64(string attribute) nothrow
  {
    long _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = g_file_info_get_attribute_int64(cast(GFileInfo*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Gets the value of a #GObject attribute. If the attribute does
      not contain a #GObject, null will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: a #GObject associated with the given attribute,
        or null otherwise.
  */
  gid.gobject2.object.ObjectWrap getAttributeObject(string attribute) nothrow
  {
    GObject* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_object(cast(GFileInfo*)this._cPtr, _attribute);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the attribute status for an attribute key.
  
      Params:
        attribute = a file attribute key
      Returns: a #GFileAttributeStatus for the given attribute, or
           [gid.gio2.types.FileAttributeStatus.Unset] if the key is invalid.
  */
  gid.gio2.types.FileAttributeStatus getAttributeStatus(string attribute) nothrow
  {
    GFileAttributeStatus _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_status(cast(GFileInfo*)this._cPtr, _attribute);
    gid.gio2.types.FileAttributeStatus _retval = cast(gid.gio2.types.FileAttributeStatus)_cretval;
    return _retval;
  }

  /**
      Gets the value of a string attribute. If the attribute does
      not contain a string, null will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: the contents of the attribute value as a UTF-8 string,
        or null otherwise.
  */
  string getAttributeString(string attribute) nothrow
  {
    const(char)* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_string(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value of a stringv attribute. If the attribute does
      not contain a stringv, null will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: the contents of the attribute value as a stringv,
        or null otherwise. Do not free. These returned strings are UTF-8.
  */
  string[] getAttributeStringv(string attribute) nothrow
  {
    char** _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_stringv(cast(GFileInfo*)this._cPtr, _attribute);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Gets the attribute type for an attribute key.
  
      Params:
        attribute = a file attribute key.
      Returns: a #GFileAttributeType for the given attribute, or
        [gid.gio2.types.FileAttributeType.Invalid] if the key is not set.
  */
  gid.gio2.types.FileAttributeType getAttributeType(string attribute) nothrow
  {
    GFileAttributeType _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_info_get_attribute_type(cast(GFileInfo*)this._cPtr, _attribute);
    gid.gio2.types.FileAttributeType _retval = cast(gid.gio2.types.FileAttributeType)_cretval;
    return _retval;
  }

  /**
      Gets an unsigned 32-bit integer contained within the attribute. If the
      attribute does not contain an unsigned 32-bit integer, or is invalid,
      0 will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: an unsigned 32-bit integer from the attribute.
  */
  uint getAttributeUint32(string attribute) nothrow
  {
    uint _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = g_file_info_get_attribute_uint32(cast(GFileInfo*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Gets a unsigned 64-bit integer contained within the attribute. If the
      attribute does not contain an unsigned 64-bit integer, or is invalid,
      0 will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: a unsigned 64-bit integer from the attribute.
  */
  ulong getAttributeUint64(string attribute) nothrow
  {
    ulong _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = g_file_info_get_attribute_uint64(cast(GFileInfo*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Gets the file's content type.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE].
      Returns: a string containing the file's content type,
        or null if unknown.
  */
  string getContentType() nothrow
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_content_type(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the creation time of the current info and returns it as a
      #GDateTime.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_CREATED]. If [gid.gio2.types.FILE_ATTRIBUTE_TIME_CREATED_USEC] is
      provided, the resulting #GDateTime will additionally have microsecond
      precision.
      
      If nanosecond precision is needed, [gid.gio2.types.FILE_ATTRIBUTE_TIME_CREATED_NSEC] must
      be queried separately using [gid.gio2.file_info.FileInfo.getAttributeUint32].
      Returns: creation time, or null if unknown
  */
  gid.glib2.date_time.DateTime getCreationDateTime() nothrow
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_creation_date_time(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the #GDateTime representing the deletion date of the file, as
      available in [gid.gio2.types.FILE_ATTRIBUTE_TRASH_DELETION_DATE]. If the
      [gid.gio2.types.FILE_ATTRIBUTE_TRASH_DELETION_DATE] attribute is unset, null is returned.
      Returns: a #GDateTime, or null.
  */
  gid.glib2.date_time.DateTime getDeletionDate() nothrow
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_deletion_date(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a display name for a file. This is guaranteed to always be set.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME].
      Returns: a string containing the display name.
  */
  string getDisplayName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_display_name(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the edit name for a file.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_EDIT_NAME].
      Returns: a string containing the edit name.
  */
  string getEditName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_edit_name(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the [entity tag][gid.gio2.file.File] for a given
      #GFileInfo. See [gid.gio2.types.FILE_ATTRIBUTE_ETAG_VALUE].
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_ETAG_VALUE].
      Returns: a string containing the value of the "etag:value" attribute.
  */
  string getEtag() nothrow
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_etag(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a file's type (whether it is a regular file, symlink, etc).
      This is different from the file's content type, see [gid.gio2.file_info.FileInfo.getContentType].
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_TYPE].
      Returns: a #GFileType for the given file.
  */
  gid.gio2.types.FileType getFileType() nothrow
  {
    GFileType _cretval;
    _cretval = g_file_info_get_file_type(cast(GFileInfo*)this._cPtr);
    gid.gio2.types.FileType _retval = cast(gid.gio2.types.FileType)_cretval;
    return _retval;
  }

  /**
      Gets the icon for a file.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_ICON].
      Returns: #GIcon for the given info.
  */
  gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_file_info_get_icon(cast(GFileInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a file is a backup file.
      
      The exact semantics of what constitutes a backup file are
      backend-specific. For local files, a file is considered a backup
      if its name ends with `~` and it is a regular file. This follows
      the POSIX convention used by text editors such as Emacs.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_IS_BACKUP].
      Returns: true if file is a backup file, false otherwise.
  */
  bool getIsBackup() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_info_get_is_backup(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a file is hidden.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_IS_HIDDEN].
      Returns: true if the file is a hidden file, false otherwise.
  */
  bool getIsHidden() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_info_get_is_hidden(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a file is a symlink.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_IS_SYMLINK].
      Returns: true if the given info is a symlink.
  */
  bool getIsSymlink() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_file_info_get_is_symlink(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the modification time of the current info and returns it as a
      #GDateTime.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED]. If [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED_USEC] is
      provided, the resulting #GDateTime will additionally have microsecond
      precision.
      
      If nanosecond precision is needed, [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED_NSEC] must
      be queried separately using [gid.gio2.file_info.FileInfo.getAttributeUint32].
      Returns: modification time, or null if unknown
  */
  gid.glib2.date_time.DateTime getModificationDateTime() nothrow
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_modification_date_time(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the modification time of the current info and sets it
      in result.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED]. If [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED_USEC] is
      provided it will be used too.
  
      Params:
        result = a #GTimeVal.
  
      Deprecated: Use [gid.gio2.file_info.FileInfo.getModificationDateTime] instead, as
           #GTimeVal is deprecated due to the year 2038 problem.
  */
  void getModificationTime(out gid.glib2.time_val.TimeVal result) nothrow
  {
    g_file_info_get_modification_time(cast(GFileInfo*)this._cPtr, cast(GTimeVal*)&result);
  }

  /**
      Gets the name for a file. This is guaranteed to always be set.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME].
      Returns: a string containing the file name.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_name(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the file's size (in bytes). The size is retrieved through the value of
      the [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SIZE] attribute and is converted
      from #guint64 to #goffset before returning the result.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SIZE].
      Returns: a #goffset containing the file's size (in bytes).
  */
  long getSize() nothrow
  {
    long _retval;
    _retval = g_file_info_get_size(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the sort_order attribute from the #GFileInfo.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SORT_ORDER].
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SORT_ORDER].
      Returns: a #gint32 containing the value of the "standard::sort_order" attribute.
  */
  int getSortOrder() nothrow
  {
    int _retval;
    _retval = g_file_info_get_sort_order(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the symbolic icon for a file.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON].
      Returns: #GIcon for the given info.
  */
  gid.gio2.icon.Icon getSymbolicIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_file_info_get_symbolic_icon(cast(GFileInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the symlink target for a given #GFileInfo.
      
      It is an error to call this if the #GFileInfo does not contain
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET].
      Returns: a string containing the symlink target.
  */
  string getSymlinkTarget() nothrow
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_symlink_target(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Checks if a file info structure has an attribute named attribute.
  
      Params:
        attribute = a file attribute key.
      Returns: true if info has an attribute named attribute,
            false otherwise.
  */
  bool hasAttribute(string attribute) nothrow
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_file_info_has_attribute(cast(GFileInfo*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Checks if a file info structure has an attribute in the
      specified name_space.
  
      Params:
        nameSpace = a file attribute namespace.
      Returns: true if info has an attribute in name_space,
            false otherwise.
  */
  bool hasNamespace(string nameSpace) nothrow
  {
    bool _retval;
    const(char)* _nameSpace = nameSpace.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_file_info_has_namespace(cast(GFileInfo*)this._cPtr, _nameSpace);
    return _retval;
  }

  /**
      Lists the file info structure's attributes.
  
      Params:
        nameSpace = a file attribute key's namespace, or null to list
            all attributes.
      Returns: a
        null-terminated array of strings of all of the possible attribute
        types for the given name_space, or null on error.
  */
  string[] listAttributes(string nameSpace = null) nothrow
  {
    char** _cretval;
    const(char)* _nameSpace = nameSpace.toCString!(No.Malloc, Yes.Nullable);
    _cretval = g_file_info_list_attributes(cast(GFileInfo*)this._cPtr, _nameSpace);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Removes all cases of attribute from info if it exists.
  
      Params:
        attribute = a file attribute key.
  */
  void removeAttribute(string attribute) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_remove_attribute(cast(GFileInfo*)this._cPtr, _attribute);
  }

  /**
      Sets the [gid.gio2.types.FILE_ATTRIBUTE_TIME_ACCESS] and
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_ACCESS_USEC] attributes in the file info to the
      given date/time value.
      
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_ACCESS_NSEC] will be cleared.
  
      Params:
        atime = a #GDateTime.
  */
  void setAccessDateTime(gid.glib2.date_time.DateTime atime) nothrow
  {
    g_file_info_set_access_date_time(cast(GFileInfo*)this._cPtr, atime ? cast(GDateTime*)atime._cPtr(No.Dup) : null);
  }

  /**
      Sets the attribute to contain the given value, if possible. To unset the
      attribute, use [gid.gio2.types.FileAttributeType.Invalid] for type.
  
      Params:
        attribute = a file attribute key.
        type = a #GFileAttributeType
        valueP = pointer to the value
  */
  void setAttribute(string attribute, gid.gio2.types.FileAttributeType type, void* valueP) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute(cast(GFileInfo*)this._cPtr, _attribute, type, valueP);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a boolean value.
  */
  void setAttributeBoolean(string attribute, bool attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_boolean(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a byte string.
  */
  void setAttributeByteString(string attribute, string attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    const(char)* _attrValue = attrValue.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_byte_string(cast(GFileInfo*)this._cPtr, _attribute, _attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
      
      This function is meant to be used by language bindings that have specific
      handling for Unix paths.
  
      Params:
        attribute = a file attribute key.
        attrValue = a file path.
  */
  void setAttributeFilePath(string attribute, string attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    const(char)* _attrValue = attrValue.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_file_path(cast(GFileInfo*)this._cPtr, _attribute, _attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a signed 32-bit integer
  */
  void setAttributeInt32(string attribute, int attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_int32(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = attribute name to set.
        attrValue = int64 value to set attribute to.
  */
  void setAttributeInt64(string attribute, long attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_int64(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets mask on info to match specific attribute types.
  
      Params:
        mask = a #GFileAttributeMatcher.
  */
  void setAttributeMask(gid.gio2.file_attribute_matcher.FileAttributeMatcher mask) nothrow
  {
    g_file_info_set_attribute_mask(cast(GFileInfo*)this._cPtr, mask ? cast(GFileAttributeMatcher*)mask._cPtr(No.Dup) : null);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a #GObject.
  */
  void setAttributeObject(string attribute, gid.gobject2.object.ObjectWrap attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_object(cast(GFileInfo*)this._cPtr, _attribute, attrValue ? cast(GObject*)attrValue._cPtr(No.Dup) : null);
  }

  /**
      Sets the attribute status for an attribute key. This is only
      needed by external code that implement [gid.gio2.file.File.setAttributesFromInfo]
      or similar functions.
      
      The attribute must exist in info for this to work. Otherwise false
      is returned and info is unchanged.
  
      Params:
        attribute = a file attribute key
        status = a #GFileAttributeStatus
      Returns: true if the status was changed, false if the key was not set.
  */
  bool setAttributeStatus(string attribute, gid.gio2.types.FileAttributeStatus status) nothrow
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_file_info_set_attribute_status(cast(GFileInfo*)this._cPtr, _attribute, status);
    return _retval;
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a UTF-8 string.
  */
  void setAttributeString(string attribute, string attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    const(char)* _attrValue = attrValue.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_string(cast(GFileInfo*)this._cPtr, _attribute, _attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
      
      Sinze: 2.22
  
      Params:
        attribute = a file attribute key
        attrValue = a null
            terminated array of UTF-8 strings.
  */
  void setAttributeStringv(string attribute, string[] attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    auto _attrValue_arr = new char*[](attrValue.length + 1);
    auto _attrValue = cast(char**)_attrValue_arr.ptr;
    foreach (i, s; attrValue) _attrValue[i] = s.toCString!(No.Malloc);
    g_file_info_set_attribute_stringv(cast(GFileInfo*)this._cPtr, _attribute, _attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = an unsigned 32-bit integer.
  */
  void setAttributeUint32(string attribute, uint attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_uint32(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = an unsigned 64-bit integer.
  */
  void setAttributeUint64(string attribute, ulong attrValue) nothrow
  {
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_attribute_uint64(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the content type attribute for a given #GFileInfo.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE].
  
      Params:
        contentType = a [content type](content-types.html#content-types).
  */
  void setContentType(string contentType) nothrow
  {
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_content_type(cast(GFileInfo*)this._cPtr, _contentType);
  }

  /**
      Sets the [gid.gio2.types.FILE_ATTRIBUTE_TIME_CREATED] and
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_CREATED_USEC] attributes in the file info to the
      given date/time value.
      
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_CREATED_NSEC] will be cleared.
  
      Params:
        creationTime = a #GDateTime.
  */
  void setCreationDateTime(gid.glib2.date_time.DateTime creationTime) nothrow
  {
    g_file_info_set_creation_date_time(cast(GFileInfo*)this._cPtr, creationTime ? cast(GDateTime*)creationTime._cPtr(No.Dup) : null);
  }

  /**
      Sets the display name for the current #GFileInfo.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME].
  
      Params:
        displayName = a string containing a display name.
  */
  void setDisplayName(string displayName) nothrow
  {
    const(char)* _displayName = displayName.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_display_name(cast(GFileInfo*)this._cPtr, _displayName);
  }

  /**
      Sets the edit name for the current file.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_EDIT_NAME].
  
      Params:
        editName = a string containing an edit name.
  */
  void setEditName(string editName) nothrow
  {
    const(char)* _editName = editName.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_edit_name(cast(GFileInfo*)this._cPtr, _editName);
  }

  /**
      Sets the file type in a #GFileInfo to type.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_TYPE].
  
      Params:
        type = a #GFileType.
  */
  void setFileType(gid.gio2.types.FileType type) nothrow
  {
    g_file_info_set_file_type(cast(GFileInfo*)this._cPtr, type);
  }

  /**
      Sets the icon for a given #GFileInfo.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_ICON].
  
      Params:
        icon = a #GIcon.
  */
  void setIcon(gid.gio2.icon.Icon icon) nothrow
  {
    g_file_info_set_icon(cast(GFileInfo*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the "is_hidden" attribute in a #GFileInfo according to is_hidden.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_IS_HIDDEN].
  
      Params:
        isHidden = a #gboolean.
  */
  void setIsHidden(bool isHidden) nothrow
  {
    g_file_info_set_is_hidden(cast(GFileInfo*)this._cPtr, isHidden);
  }

  /**
      Sets the "is_symlink" attribute in a #GFileInfo according to is_symlink.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_IS_SYMLINK].
  
      Params:
        isSymlink = a #gboolean.
  */
  void setIsSymlink(bool isSymlink) nothrow
  {
    g_file_info_set_is_symlink(cast(GFileInfo*)this._cPtr, isSymlink);
  }

  /**
      Sets the [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED] and
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED_USEC] attributes in the file info to the
      given date/time value.
      
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED_NSEC] will be cleared.
  
      Params:
        mtime = a #GDateTime.
  */
  void setModificationDateTime(gid.glib2.date_time.DateTime mtime) nothrow
  {
    g_file_info_set_modification_date_time(cast(GFileInfo*)this._cPtr, mtime ? cast(GDateTime*)mtime._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED] and
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED_USEC] attributes in the file info to the
      given time value.
      
      [gid.gio2.types.FILE_ATTRIBUTE_TIME_MODIFIED_NSEC] will be cleared.
  
      Params:
        mtime = a #GTimeVal.
  
      Deprecated: Use [gid.gio2.file_info.FileInfo.setModificationDateTime] instead, as
           #GTimeVal is deprecated due to the year 2038 problem.
  */
  void setModificationTime(gid.glib2.time_val.TimeVal mtime) nothrow
  {
    g_file_info_set_modification_time(cast(GFileInfo*)this._cPtr, cast(GTimeVal*)&mtime);
  }

  /**
      Sets the name attribute for the current #GFileInfo.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_NAME].
  
      Params:
        name = a string containing a name.
  */
  void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_name(cast(GFileInfo*)this._cPtr, _name);
  }

  /**
      Sets the [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SIZE] attribute in the file info
      to the given size.
  
      Params:
        size = a #goffset containing the file's size.
  */
  void setSize(long size) nothrow
  {
    g_file_info_set_size(cast(GFileInfo*)this._cPtr, size);
  }

  /**
      Sets the sort order attribute in the file info structure. See
      [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SORT_ORDER].
  
      Params:
        sortOrder = a sort order integer.
  */
  void setSortOrder(int sortOrder) nothrow
  {
    g_file_info_set_sort_order(cast(GFileInfo*)this._cPtr, sortOrder);
  }

  /**
      Sets the symbolic icon for a given #GFileInfo.
      See [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON].
  
      Params:
        icon = a #GIcon.
  */
  void setSymbolicIcon(gid.gio2.icon.Icon icon) nothrow
  {
    g_file_info_set_symbolic_icon(cast(GFileInfo*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gio2.types.FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET] attribute in the file info
      to the given symlink target.
  
      Params:
        symlinkTarget = a static string containing a path to a symlink target.
  */
  void setSymlinkTarget(string symlinkTarget) nothrow
  {
    const(char)* _symlinkTarget = symlinkTarget.toCString!(No.Malloc, No.Nullable);
    g_file_info_set_symlink_target(cast(GFileInfo*)this._cPtr, _symlinkTarget);
  }

  /**
      Unsets a mask set by [gid.gio2.file_info.FileInfo.setAttributeMask], if one
      is set.
  */
  void unsetAttributeMask() nothrow
  {
    g_file_info_unset_attribute_mask(cast(GFileInfo*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gio2.file_info.FileInfo]
class FileInfoGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.file_info.FileInfo]
final class FileInfoGidBuilder : FileInfoGidBuilderImpl!FileInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileInfo build() nothrow
  {
    return new FileInfo(cast(void*)createGObject(FileInfo._getGType), Yes.Take);
  }
}
