/// Module for [FileInfo] class
module gio.file_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file_attribute_matcher;
import gio.icon;
import gio.types;
import glib.date_time;
import glib.time_val;
import gobject.object;

/**
    Stores information about a file system object referenced by a [gio.file.File].
    
    Functionality for manipulating basic metadata for files. [gio.file_info.FileInfo]
    implements methods for getting information that all files should
    contain, and allows for manipulation of extended attributes.
    
    See [file-attributes.html](file attributes) for more information on how GIO
    handles file attributes.
    
    To obtain a [gio.file_info.FileInfo] for a [gio.file.File], use
    [gio.file.File.queryInfo] (or its async variant). To obtain a [gio.file_info.FileInfo]
    for a file input or output stream, use [gio.file_input_stream.FileInputStream.queryInfo]
    or [gio.file_output_stream.FileOutputStream.queryInfo] (or their async variants).
    
    To change the actual attributes of a file, you should then set the
    attribute in the [gio.file_info.FileInfo] and call [gio.file.File.setAttributesFromInfo]
    or [gio.file.File.setAttributesAsync] on a [gio.file.File].
    
    However, not all attributes can be changed in the file. For instance,
    the actual size of a file cannot be changed via [gio.file_info.FileInfo.setSize].
    You may call [gio.file.File.querySettableAttributes] and
    [gio.file.File.queryWritableNamespaces] to discover the settable attributes
    of a particular file at runtime.
    
    The direct accessors, such as [gio.file_info.FileInfo.getName], are slightly more
    optimized than the generic attribute accessors, such as
    [gio.file_info.FileInfo.getAttributeByteString].This optimization will matter
    only if calling the API in a tight loop.
    
    It is an error to call these accessors without specifying their required file
    attributes when creating the [gio.file_info.FileInfo]. Use
    [gio.file_info.FileInfo.hasAttribute] or [gio.file_info.FileInfo.listAttributes]
    to check what attributes are specified for a [gio.file_info.FileInfo].
    
    [gio.file_attribute_matcher.FileAttributeMatcher] allows for searching through a [gio.file_info.FileInfo]
    for attributes.
*/
class FileInfo : gobject.object.ObjectWrap
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
    return cast(void function())g_file_info_get_type != &gidSymbolNotFound ? g_file_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileInfo self()
  {
    return this;
  }

  /**
      Creates a new file info structure.
      Returns: a #GFileInfo.
  */
  this()
  {
    GFileInfo* _cretval;
    _cretval = g_file_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Clears the status information from info.
  */
  void clearStatus()
  {
    g_file_info_clear_status(cast(GFileInfo*)this._cPtr);
  }

  /**
      First clears all of the [GFileAttribute][gio-GFileAttribute] of dest_info,
      and then copies all of the file attributes from src_info to dest_info.
  
      Params:
        destInfo = destination to copy attributes to.
  */
  void copyInto(gio.file_info.FileInfo destInfo)
  {
    g_file_info_copy_into(cast(GFileInfo*)this._cPtr, destInfo ? cast(GFileInfo*)destInfo._cPtr(No.Dup) : null);
  }

  /**
      Duplicates a file info structure.
      Returns: a duplicate #GFileInfo of other.
  */
  gio.file_info.FileInfo dup()
  {
    GFileInfo* _cretval;
    _cretval = g_file_info_dup(cast(GFileInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the access time of the current info and returns it as a
      #GDateTime.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_TIME_ACCESS`. If `G_FILE_ATTRIBUTE_TIME_ACCESS_USEC` is
      provided, the resulting #GDateTime will additionally have microsecond
      precision.
      
      If nanosecond precision is needed, `G_FILE_ATTRIBUTE_TIME_ACCESS_NSEC` must
      be queried separately using [gio.file_info.FileInfo.getAttributeUint32].
      Returns: access time, or null if unknown
  */
  glib.date_time.DateTime getAccessDateTime()
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_access_date_time(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value of an attribute, formatted as a string.
      This escapes things as needed to make the string valid
      UTF-8.
  
      Params:
        attribute = a file attribute key.
      Returns: a UTF-8 string associated with the given attribute, or
           null if the attribute wasn’t set.
           When you're done with the string it must be freed with [glib.global.gfree].
  */
  string getAttributeAsString(string attribute)
  {
    char* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_as_string(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the value of a boolean attribute. If the attribute does not
      contain a boolean value, false will be returned.
  
      Params:
        attribute = a file attribute key.
      Returns: the boolean value contained within the attribute.
  */
  bool getAttributeBoolean(string attribute)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
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
  string getAttributeByteString(string attribute)
  {
    const(char)* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_byte_string(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  bool getAttributeData(string attribute, out gio.types.FileAttributeType type, out void* valuePp, out gio.types.FileAttributeStatus status)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
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
  string getAttributeFilePath(string attribute)
  {
    const(char)* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_file_path(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  int getAttributeInt32(string attribute)
  {
    int _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
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
  long getAttributeInt64(string attribute)
  {
    long _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
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
  gobject.object.ObjectWrap getAttributeObject(string attribute)
  {
    GObject* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_object(cast(GFileInfo*)this._cPtr, _attribute);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the attribute status for an attribute key.
  
      Params:
        attribute = a file attribute key
      Returns: a #GFileAttributeStatus for the given attribute, or
           [gio.types.FileAttributeStatus.Unset] if the key is invalid.
  */
  gio.types.FileAttributeStatus getAttributeStatus(string attribute)
  {
    GFileAttributeStatus _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_status(cast(GFileInfo*)this._cPtr, _attribute);
    gio.types.FileAttributeStatus _retval = cast(gio.types.FileAttributeStatus)_cretval;
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
  string getAttributeString(string attribute)
  {
    const(char)* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_string(cast(GFileInfo*)this._cPtr, _attribute);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  string[] getAttributeStringv(string attribute)
  {
    char** _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_stringv(cast(GFileInfo*)this._cPtr, _attribute);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the attribute type for an attribute key.
  
      Params:
        attribute = a file attribute key.
      Returns: a #GFileAttributeType for the given attribute, or
        [gio.types.FileAttributeType.Invalid] if the key is not set.
  */
  gio.types.FileAttributeType getAttributeType(string attribute)
  {
    GFileAttributeType _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_file_info_get_attribute_type(cast(GFileInfo*)this._cPtr, _attribute);
    gio.types.FileAttributeType _retval = cast(gio.types.FileAttributeType)_cretval;
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
  uint getAttributeUint32(string attribute)
  {
    uint _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
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
  ulong getAttributeUint64(string attribute)
  {
    ulong _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _retval = g_file_info_get_attribute_uint64(cast(GFileInfo*)this._cPtr, _attribute);
    return _retval;
  }

  /**
      Gets the file's content type.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE`.
      Returns: a string containing the file's content type,
        or null if unknown.
  */
  string getContentType()
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_content_type(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the creation time of the current info and returns it as a
      #GDateTime.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_TIME_CREATED`. If `G_FILE_ATTRIBUTE_TIME_CREATED_USEC` is
      provided, the resulting #GDateTime will additionally have microsecond
      precision.
      
      If nanosecond precision is needed, `G_FILE_ATTRIBUTE_TIME_CREATED_NSEC` must
      be queried separately using [gio.file_info.FileInfo.getAttributeUint32].
      Returns: creation time, or null if unknown
  */
  glib.date_time.DateTime getCreationDateTime()
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_creation_date_time(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the #GDateTime representing the deletion date of the file, as
      available in `G_FILE_ATTRIBUTE_TRASH_DELETION_DATE`. If the
      `G_FILE_ATTRIBUTE_TRASH_DELETION_DATE` attribute is unset, null is returned.
      Returns: a #GDateTime, or null.
  */
  glib.date_time.DateTime getDeletionDate()
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_deletion_date(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a display name for a file. This is guaranteed to always be set.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME`.
      Returns: a string containing the display name.
  */
  string getDisplayName()
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_display_name(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the edit name for a file.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME`.
      Returns: a string containing the edit name.
  */
  string getEditName()
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_edit_name(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the [entity tag](iface.File.html#entity-tags) for a given
      #GFileInfo. See `G_FILE_ATTRIBUTE_ETAG_VALUE`.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_ETAG_VALUE`.
      Returns: a string containing the value of the "etag:value" attribute.
  */
  string getEtag()
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_etag(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a file's type (whether it is a regular file, symlink, etc).
      This is different from the file's content type, see [gio.file_info.FileInfo.getContentType].
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_TYPE`.
      Returns: a #GFileType for the given file.
  */
  gio.types.FileType getFileType()
  {
    GFileType _cretval;
    _cretval = g_file_info_get_file_type(cast(GFileInfo*)this._cPtr);
    gio.types.FileType _retval = cast(gio.types.FileType)_cretval;
    return _retval;
  }

  /**
      Gets the icon for a file.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_ICON`.
      Returns: #GIcon for the given info.
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = g_file_info_get_icon(cast(GFileInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a file is a backup file.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_IS_BACKUP`.
      Returns: true if file is a backup file, false otherwise.
  */
  bool getIsBackup()
  {
    bool _retval;
    _retval = cast(bool)g_file_info_get_is_backup(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a file is hidden.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN`.
      Returns: true if the file is a hidden file, false otherwise.
  */
  bool getIsHidden()
  {
    bool _retval;
    _retval = cast(bool)g_file_info_get_is_hidden(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a file is a symlink.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK`.
      Returns: true if the given info is a symlink.
  */
  bool getIsSymlink()
  {
    bool _retval;
    _retval = cast(bool)g_file_info_get_is_symlink(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the modification time of the current info and returns it as a
      #GDateTime.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_TIME_MODIFIED`. If `G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC` is
      provided, the resulting #GDateTime will additionally have microsecond
      precision.
      
      If nanosecond precision is needed, `G_FILE_ATTRIBUTE_TIME_MODIFIED_NSEC` must
      be queried separately using [gio.file_info.FileInfo.getAttributeUint32].
      Returns: modification time, or null if unknown
  */
  glib.date_time.DateTime getModificationDateTime()
  {
    GDateTime* _cretval;
    _cretval = g_file_info_get_modification_date_time(cast(GFileInfo*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the modification time of the current info and sets it
      in result.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_TIME_MODIFIED`. If `G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC` is
      provided it will be used too.
  
      Params:
        result = a #GTimeVal.
  
      Deprecated: Use [gio.file_info.FileInfo.getModificationDateTime] instead, as
           #GTimeVal is deprecated due to the year 2038 problem.
  */
  void getModificationTime(out glib.time_val.TimeVal result)
  {
    GTimeVal _result;
    g_file_info_get_modification_time(cast(GFileInfo*)this._cPtr, &_result);
    result = new glib.time_val.TimeVal(cast(void*)&_result, No.Take);
  }

  /**
      Gets the name for a file. This is guaranteed to always be set.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_NAME`.
      Returns: a string containing the file name.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_name(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the file's size (in bytes). The size is retrieved through the value of
      the `G_FILE_ATTRIBUTE_STANDARD_SIZE` attribute and is converted
      from #guint64 to #goffset before returning the result.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_SIZE`.
      Returns: a #goffset containing the file's size (in bytes).
  */
  long getSize()
  {
    long _retval;
    _retval = g_file_info_get_size(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the sort_order attribute from the #GFileInfo.
      See `G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER`.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER`.
      Returns: a #gint32 containing the value of the "standard::sort_order" attribute.
  */
  int getSortOrder()
  {
    int _retval;
    _retval = g_file_info_get_sort_order(cast(GFileInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the symbolic icon for a file.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON`.
      Returns: #GIcon for the given info.
  */
  gio.icon.Icon getSymbolicIcon()
  {
    GIcon* _cretval;
    _cretval = g_file_info_get_symbolic_icon(cast(GFileInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the symlink target for a given #GFileInfo.
      
      It is an error to call this if the #GFileInfo does not contain
      `G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET`.
      Returns: a string containing the symlink target.
  */
  string getSymlinkTarget()
  {
    const(char)* _cretval;
    _cretval = g_file_info_get_symlink_target(cast(GFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks if a file info structure has an attribute named attribute.
  
      Params:
        attribute = a file attribute key.
      Returns: true if info has an attribute named attribute,
            false otherwise.
  */
  bool hasAttribute(string attribute)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
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
  bool hasNamespace(string nameSpace)
  {
    bool _retval;
    const(char)* _nameSpace = nameSpace.toCString(No.Alloc);
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
  string[] listAttributes(string nameSpace = null)
  {
    char** _cretval;
    const(char)* _nameSpace = nameSpace.toCString(No.Alloc);
    _cretval = g_file_info_list_attributes(cast(GFileInfo*)this._cPtr, _nameSpace);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Removes all cases of attribute from info if it exists.
  
      Params:
        attribute = a file attribute key.
  */
  void removeAttribute(string attribute)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_remove_attribute(cast(GFileInfo*)this._cPtr, _attribute);
  }

  /**
      Sets the `G_FILE_ATTRIBUTE_TIME_ACCESS` and
      `G_FILE_ATTRIBUTE_TIME_ACCESS_USEC` attributes in the file info to the
      given date/time value.
      
      `G_FILE_ATTRIBUTE_TIME_ACCESS_NSEC` will be cleared.
  
      Params:
        atime = a #GDateTime.
  */
  void setAccessDateTime(glib.date_time.DateTime atime)
  {
    g_file_info_set_access_date_time(cast(GFileInfo*)this._cPtr, atime ? cast(GDateTime*)atime._cPtr(No.Dup) : null);
  }

  /**
      Sets the attribute to contain the given value, if possible. To unset the
      attribute, use [gio.types.FileAttributeType.Invalid] for type.
  
      Params:
        attribute = a file attribute key.
        type = a #GFileAttributeType
        valueP = pointer to the value
  */
  void setAttribute(string attribute, gio.types.FileAttributeType type, void* valueP)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_set_attribute(cast(GFileInfo*)this._cPtr, _attribute, type, valueP);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a boolean value.
  */
  void setAttributeBoolean(string attribute, bool attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_set_attribute_boolean(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a byte string.
  */
  void setAttributeByteString(string attribute, string attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    const(char)* _attrValue = attrValue.toCString(No.Alloc);
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
  void setAttributeFilePath(string attribute, string attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    const(char)* _attrValue = attrValue.toCString(No.Alloc);
    g_file_info_set_attribute_file_path(cast(GFileInfo*)this._cPtr, _attribute, _attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = a signed 32-bit integer
  */
  void setAttributeInt32(string attribute, int attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_set_attribute_int32(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = attribute name to set.
        attrValue = int64 value to set attribute to.
  */
  void setAttributeInt64(string attribute, long attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_set_attribute_int64(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets mask on info to match specific attribute types.
  
      Params:
        mask = a #GFileAttributeMatcher.
  */
  void setAttributeMask(gio.file_attribute_matcher.FileAttributeMatcher mask)
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
  void setAttributeObject(string attribute, gobject.object.ObjectWrap attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_set_attribute_object(cast(GFileInfo*)this._cPtr, _attribute, attrValue ? cast(GObject*)attrValue._cPtr(No.Dup) : null);
  }

  /**
      Sets the attribute status for an attribute key. This is only
      needed by external code that implement [gio.file.File.setAttributesFromInfo]
      or similar functions.
      
      The attribute must exist in info for this to work. Otherwise false
      is returned and info is unchanged.
  
      Params:
        attribute = a file attribute key
        status = a #GFileAttributeStatus
      Returns: true if the status was changed, false if the key was not set.
  */
  bool setAttributeStatus(string attribute, gio.types.FileAttributeStatus status)
  {
    bool _retval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
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
  void setAttributeString(string attribute, string attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    const(char)* _attrValue = attrValue.toCString(No.Alloc);
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
  void setAttributeStringv(string attribute, string[] attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    char*[] _tmpattrValue;
    foreach (s; attrValue)
      _tmpattrValue ~= s.toCString(No.Alloc);
    _tmpattrValue ~= null;
    char** _attrValue = _tmpattrValue.ptr;
    g_file_info_set_attribute_stringv(cast(GFileInfo*)this._cPtr, _attribute, _attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = an unsigned 32-bit integer.
  */
  void setAttributeUint32(string attribute, uint attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_set_attribute_uint32(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the attribute to contain the given attr_value,
      if possible.
  
      Params:
        attribute = a file attribute key.
        attrValue = an unsigned 64-bit integer.
  */
  void setAttributeUint64(string attribute, ulong attrValue)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_file_info_set_attribute_uint64(cast(GFileInfo*)this._cPtr, _attribute, attrValue);
  }

  /**
      Sets the content type attribute for a given #GFileInfo.
      See `G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE`.
  
      Params:
        contentType = a content type. See [GContentType][gio-GContentType]
  */
  void setContentType(string contentType)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    g_file_info_set_content_type(cast(GFileInfo*)this._cPtr, _contentType);
  }

  /**
      Sets the `G_FILE_ATTRIBUTE_TIME_CREATED` and
      `G_FILE_ATTRIBUTE_TIME_CREATED_USEC` attributes in the file info to the
      given date/time value.
      
      `G_FILE_ATTRIBUTE_TIME_CREATED_NSEC` will be cleared.
  
      Params:
        creationTime = a #GDateTime.
  */
  void setCreationDateTime(glib.date_time.DateTime creationTime)
  {
    g_file_info_set_creation_date_time(cast(GFileInfo*)this._cPtr, creationTime ? cast(GDateTime*)creationTime._cPtr(No.Dup) : null);
  }

  /**
      Sets the display name for the current #GFileInfo.
      See `G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME`.
  
      Params:
        displayName = a string containing a display name.
  */
  void setDisplayName(string displayName)
  {
    const(char)* _displayName = displayName.toCString(No.Alloc);
    g_file_info_set_display_name(cast(GFileInfo*)this._cPtr, _displayName);
  }

  /**
      Sets the edit name for the current file.
      See `G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME`.
  
      Params:
        editName = a string containing an edit name.
  */
  void setEditName(string editName)
  {
    const(char)* _editName = editName.toCString(No.Alloc);
    g_file_info_set_edit_name(cast(GFileInfo*)this._cPtr, _editName);
  }

  /**
      Sets the file type in a #GFileInfo to type.
      See `G_FILE_ATTRIBUTE_STANDARD_TYPE`.
  
      Params:
        type = a #GFileType.
  */
  void setFileType(gio.types.FileType type)
  {
    g_file_info_set_file_type(cast(GFileInfo*)this._cPtr, type);
  }

  /**
      Sets the icon for a given #GFileInfo.
      See `G_FILE_ATTRIBUTE_STANDARD_ICON`.
  
      Params:
        icon = a #GIcon.
  */
  void setIcon(gio.icon.Icon icon)
  {
    g_file_info_set_icon(cast(GFileInfo*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the "is_hidden" attribute in a #GFileInfo according to is_hidden.
      See `G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN`.
  
      Params:
        isHidden = a #gboolean.
  */
  void setIsHidden(bool isHidden)
  {
    g_file_info_set_is_hidden(cast(GFileInfo*)this._cPtr, isHidden);
  }

  /**
      Sets the "is_symlink" attribute in a #GFileInfo according to is_symlink.
      See `G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK`.
  
      Params:
        isSymlink = a #gboolean.
  */
  void setIsSymlink(bool isSymlink)
  {
    g_file_info_set_is_symlink(cast(GFileInfo*)this._cPtr, isSymlink);
  }

  /**
      Sets the `G_FILE_ATTRIBUTE_TIME_MODIFIED` and
      `G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC` attributes in the file info to the
      given date/time value.
      
      `G_FILE_ATTRIBUTE_TIME_MODIFIED_NSEC` will be cleared.
  
      Params:
        mtime = a #GDateTime.
  */
  void setModificationDateTime(glib.date_time.DateTime mtime)
  {
    g_file_info_set_modification_date_time(cast(GFileInfo*)this._cPtr, mtime ? cast(GDateTime*)mtime._cPtr(No.Dup) : null);
  }

  /**
      Sets the `G_FILE_ATTRIBUTE_TIME_MODIFIED` and
      `G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC` attributes in the file info to the
      given time value.
      
      `G_FILE_ATTRIBUTE_TIME_MODIFIED_NSEC` will be cleared.
  
      Params:
        mtime = a #GTimeVal.
  
      Deprecated: Use [gio.file_info.FileInfo.setModificationDateTime] instead, as
           #GTimeVal is deprecated due to the year 2038 problem.
  */
  void setModificationTime(glib.time_val.TimeVal mtime)
  {
    g_file_info_set_modification_time(cast(GFileInfo*)this._cPtr, mtime ? cast(GTimeVal*)mtime._cPtr : null);
  }

  /**
      Sets the name attribute for the current #GFileInfo.
      See `G_FILE_ATTRIBUTE_STANDARD_NAME`.
  
      Params:
        name = a string containing a name.
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    g_file_info_set_name(cast(GFileInfo*)this._cPtr, _name);
  }

  /**
      Sets the `G_FILE_ATTRIBUTE_STANDARD_SIZE` attribute in the file info
      to the given size.
  
      Params:
        size = a #goffset containing the file's size.
  */
  void setSize(long size)
  {
    g_file_info_set_size(cast(GFileInfo*)this._cPtr, size);
  }

  /**
      Sets the sort order attribute in the file info structure. See
      `G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER`.
  
      Params:
        sortOrder = a sort order integer.
  */
  void setSortOrder(int sortOrder)
  {
    g_file_info_set_sort_order(cast(GFileInfo*)this._cPtr, sortOrder);
  }

  /**
      Sets the symbolic icon for a given #GFileInfo.
      See `G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON`.
  
      Params:
        icon = a #GIcon.
  */
  void setSymbolicIcon(gio.icon.Icon icon)
  {
    g_file_info_set_symbolic_icon(cast(GFileInfo*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the `G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET` attribute in the file info
      to the given symlink target.
  
      Params:
        symlinkTarget = a static string containing a path to a symlink target.
  */
  void setSymlinkTarget(string symlinkTarget)
  {
    const(char)* _symlinkTarget = symlinkTarget.toCString(No.Alloc);
    g_file_info_set_symlink_target(cast(GFileInfo*)this._cPtr, _symlinkTarget);
  }

  /**
      Unsets a mask set by [gio.file_info.FileInfo.setAttributeMask], if one
      is set.
  */
  void unsetAttributeMask()
  {
    g_file_info_unset_attribute_mask(cast(GFileInfo*)this._cPtr);
  }
}
