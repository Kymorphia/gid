/// Module for [FileAttributeInfoList] class
module gid.gio2.file_attribute_info_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.file_attribute_info;
import gid.gio2.types;
import gid.gobject2.boxed;

/**
    Acts as a lightweight registry for possible valid file attributes.
    The registry stores Key-Value pair formats as #GFileAttributeInfos.
*/
class FileAttributeInfoList : gid.gobject2.boxed.BoxedWrap!(g_file_attribute_info_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override FileAttributeInfoList self() nothrow
  {
    return this;
  }

  /**
      Get `infos` field.
      Returns: an array of #GFileAttributeInfos.
  */
  @property gid.gio2.file_attribute_info.FileAttributeInfo infos() nothrow
  {
    return (cast(GFileAttributeInfoList*)this._cPtr).infos ? new gid.gio2.file_attribute_info.FileAttributeInfo(cast(GFileAttributeInfo*)(cast(GFileAttributeInfoList*)this._cPtr).infos, this) : null;
  }

  /**
      Get `nInfos` field.
      Returns: the number of values in the array.
  */
  @property int nInfos() nothrow
  {
    return (cast(GFileAttributeInfoList*)this._cPtr).nInfos;
  }

  /**
      Set `nInfos` field.
      Params:
        propval = the number of values in the array.
  */
  @property void nInfos(int propval) nothrow
  {
    (cast(GFileAttributeInfoList*)this._cPtr).nInfos = propval;
  }

  /**
      Creates a new file attribute info list.
      Returns: a #GFileAttributeInfoList.
  */
  this() nothrow
  {
    GFileAttributeInfoList* _cretval;
    _cretval = g_file_attribute_info_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a new attribute with name to the list, setting
      its type and flags.
  
      Params:
        name = the name of the attribute to add.
        type = the #GFileAttributeType for the attribute.
        flags = #GFileAttributeInfoFlags for the attribute.
  */
  void add(string name, gid.gio2.types.FileAttributeType type, gid.gio2.types.FileAttributeInfoFlags flags) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    g_file_attribute_info_list_add(cast(GFileAttributeInfoList*)this._cPtr, _name, type, flags);
  }

  /**
      Makes a duplicate of a file attribute info list.
      Returns: a copy of the given list.
  */
  gid.gio2.file_attribute_info_list.FileAttributeInfoList dup() nothrow
  {
    GFileAttributeInfoList* _cretval;
    _cretval = g_file_attribute_info_list_dup(cast(GFileAttributeInfoList*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.file_attribute_info_list.FileAttributeInfoList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the file attribute with the name name from list.
  
      Params:
        name = the name of the attribute to look up.
      Returns: a #GFileAttributeInfo for the name, or null if an
        attribute isn't found.
  */
  gid.gio2.file_attribute_info.FileAttributeInfo lookup(string name) nothrow
  {
    const(GFileAttributeInfo)* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_file_attribute_info_list_lookup(cast(GFileAttributeInfoList*)this._cPtr, _name);
    auto _retval = _cretval ? new gid.gio2.file_attribute_info.FileAttributeInfo(cast(GFileAttributeInfo*)_cretval, this) : null;
    return _retval;
  }
}
