/// Module for [FileInfo] class
module arrow.file_info;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FileInfo : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_info_get_type != &gidSymbolNotFound ? garrow_file_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.file_info.FileInfo]
      Returns: New builder object
  */
  static FileInfoGidBuilder builder() nothrow
  {
    return new FileInfoGidBuilder;
  }

  /**
      Get `baseName` property.
      Returns: The file base name (component after the last directory separator).
  */
  @property string baseName() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("base-name");
  }

  /**
      Get `dirName` property.
      Returns: The directory base name (component before the file base name).
  */
  @property string dirName() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("dir-name");
  }

  /**
      Get `extension` property.
      Returns: The file extension (excluding the dot).
  */
  @property string extension() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("extension");
  }

  /**
      Get `mtime` property.
      Returns: The time of last modification, if available.
  */
  @property long mtime() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("mtime");
  }

  /**
      Set `mtime` property.
      Params:
        propval = The time of last modification, if available.
  */
  @property void mtime(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("mtime", propval);
  }

  /**
      Get `path` property.
      Returns: The full file path in the file system.
  */
  @property string path() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("path");
  }

  /**
      Set `path` property.
      Params:
        propval = The full file path in the file system.
  */
  @property void path(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("path", propval);
  }

  /**
      Get `size` property.
      Returns: The size in bytes, if available
        Only regular files are guaranteed to have a size.
  */
  @property long size() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("size");
  }

  /**
      Set `size` property.
      Params:
        propval = The size in bytes, if available
          Only regular files are guaranteed to have a size.
  */
  @property void size(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("size", propval);
  }

  /**
      Get `type` property.
      Returns: The type of the entry.
  */
  @property arrow.types.FileType type() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.FileType)("type");
  }

  /**
      Set `type` property.
      Params:
        propval = The type of the entry.
  */
  @property void type(arrow.types.FileType propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.FileType)("type", propval);
  }

  /** */
  this() nothrow
  {
    GArrowFileInfo* _cretval;
    _cretval = garrow_file_info_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.file_info.FileInfo otherFileInfo) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_file_info_equal(cast(GArrowFileInfo*)this._cPtr, otherFileInfo ? cast(GArrowFileInfo*)otherFileInfo._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool isDir() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_file_info_is_dir(cast(GArrowFileInfo*)this._cPtr);
    return _retval;
  }

  /** */
  bool isFile() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_file_info_is_file(cast(GArrowFileInfo*)this._cPtr);
    return _retval;
  }

  /** */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = garrow_file_info_to_string(cast(GArrowFileInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.file_info.FileInfo]
class FileInfoGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `mtime` property.
      Params:
        propval = The time of last modification, if available.
      Returns: Builder instance for fluent chaining
  */
  T mtime(long propval) nothrow
  {
    return setProperty("mtime", propval);
  }

  /**
      Set `path` property.
      Params:
        propval = The full file path in the file system.
      Returns: Builder instance for fluent chaining
  */
  T path(string propval) nothrow
  {
    return setProperty("path", propval);
  }

  /**
      Set `size` property.
      Params:
        propval = The size in bytes, if available
          Only regular files are guaranteed to have a size.
      Returns: Builder instance for fluent chaining
  */
  T size(long propval) nothrow
  {
    return setProperty("size", propval);
  }

  /**
      Set `type` property.
      Params:
        propval = The type of the entry.
      Returns: Builder instance for fluent chaining
  */
  T type(arrow.types.FileType propval) nothrow
  {
    return setProperty("type", propval);
  }
}

/// Fluent builder for [arrow.file_info.FileInfo]
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
