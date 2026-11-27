/// Module for [FileAttributeInfo] class
module gid.gio2.file_attribute_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;

/**
    Information about a specific attribute.
*/
@gidGir("FileAttributeInfo")
class FileAttributeInfo : StructWrap!(GFileAttributeInfo)
{
  /**
      Create a `file_attribute_info.FileAttributeInfo` wrap type.
      Params:
        name = the name of the attribute.
        type = the #GFileAttributeType type of the attribute.
        flags = a set of #GFileAttributeInfoFlags.
  */
  this(string name = string.init, gid.gio2.types.FileAttributeType type = gid.gio2.types.FileAttributeType.init, gid.gio2.types.FileAttributeInfoFlags flags = gid.gio2.types.FileAttributeInfoFlags.init) nothrow
  {
    this.name = name;
    this.type = type;
    this.flags = flags;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _nameRef; // Keeps borrowed GC string alive

  /**
      Get `name` field.
      Returns: the name of the attribute.
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GFileAttributeInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the name of the attribute.
  */
  @property void name(string propval) nothrow
  {
    if (_refuseBorrowedStore("name"))
      return;

    _nameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GFileAttributeInfo*)this._cPtr).name = cast(char*)_nameRef;
  }

  /**
      Get `type` field.
      Returns: the #GFileAttributeType type of the attribute.
  */
  @property gid.gio2.types.FileAttributeType type() nothrow
  {
    return cast(gid.gio2.types.FileAttributeType)(cast(GFileAttributeInfo*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GFileAttributeType type of the attribute.
  */
  @property void type(gid.gio2.types.FileAttributeType propval) nothrow
  {
    (cast(GFileAttributeInfo*)this._cPtr).type = cast(GFileAttributeType)propval;
  }

  /**
      Get `flags` field.
      Returns: a set of #GFileAttributeInfoFlags.
  */
  @property gid.gio2.types.FileAttributeInfoFlags flags() nothrow
  {
    return cast(gid.gio2.types.FileAttributeInfoFlags)(cast(GFileAttributeInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = a set of #GFileAttributeInfoFlags.
  */
  @property void flags(gid.gio2.types.FileAttributeInfoFlags propval) nothrow
  {
    (cast(GFileAttributeInfo*)this._cPtr).flags = cast(GFileAttributeInfoFlags)propval;
  }
}
