/// Module for [FileAttributeInfo] class
module gio.file_attribute_info;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    Information about a specific attribute.
*/
class FileAttributeInfo : StructWrap!(GFileAttributeInfo)
{
  /**
      Create a `file_attribute_info.FileAttributeInfo` wrap type.
      Params:
        name = the name of the attribute.
        type = the #GFileAttributeType type of the attribute.
        flags = a set of #GFileAttributeInfoFlags.
  */
  this(string name = string.init, gio.types.FileAttributeType type = gio.types.FileAttributeType.init, gio.types.FileAttributeInfoFlags flags = gio.types.FileAttributeInfoFlags.init) nothrow
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
  @property gio.types.FileAttributeType type() nothrow
  {
    return cast(gio.types.FileAttributeType)(cast(GFileAttributeInfo*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GFileAttributeType type of the attribute.
  */
  @property void type(gio.types.FileAttributeType propval) nothrow
  {
    (cast(GFileAttributeInfo*)this._cPtr).type = cast(GFileAttributeType)propval;
  }

  /**
      Get `flags` field.
      Returns: a set of #GFileAttributeInfoFlags.
  */
  @property gio.types.FileAttributeInfoFlags flags() nothrow
  {
    return cast(gio.types.FileAttributeInfoFlags)(cast(GFileAttributeInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = a set of #GFileAttributeInfoFlags.
  */
  @property void flags(gio.types.FileAttributeInfoFlags propval) nothrow
  {
    (cast(GFileAttributeInfo*)this._cPtr).flags = cast(GFileAttributeInfoFlags)propval;
  }
}
