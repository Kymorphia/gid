/// Module for [FileAttributeInfo] class
module gio.file_attribute_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    Information about a specific attribute.
*/
class FileAttributeInfo
{
  GFileAttributeInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gio.file_attribute_info.FileAttributeInfo");

    _cInstance = *cast(GFileAttributeInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `name` field.
      Returns: the name of the attribute.
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GFileAttributeInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the name of the attribute.
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GFileAttributeInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GFileAttributeInfo*)this._cPtr).name);
  }

  /**
      Get `type` field.
      Returns: the #GFileAttributeType type of the attribute.
  */
  @property gio.types.FileAttributeType type()
  {
    return cast(gio.types.FileAttributeType)(cast(GFileAttributeInfo*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GFileAttributeType type of the attribute.
  */
  @property void type(gio.types.FileAttributeType propval)
  {
    (cast(GFileAttributeInfo*)this._cPtr).type = cast(GFileAttributeType)propval;
  }

  /**
      Get `flags` field.
      Returns: a set of #GFileAttributeInfoFlags.
  */
  @property gio.types.FileAttributeInfoFlags flags()
  {
    return cast(gio.types.FileAttributeInfoFlags)(cast(GFileAttributeInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = a set of #GFileAttributeInfoFlags.
  */
  @property void flags(gio.types.FileAttributeInfoFlags propval)
  {
    (cast(GFileAttributeInfo*)this._cPtr).flags = cast(GFileAttributeInfoFlags)propval;
  }
}
