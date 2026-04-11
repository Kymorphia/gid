/// Module for [FileIcon] class
module gio.file_icon;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.file_icon.FileIcon] specifies an icon by pointing to an image file
    to be used as icon.
    
    It implements [gio.loadable_icon.LoadableIcon].
*/
class FileIcon : gobject.object.ObjectWrap, gio.icon.Icon, gio.loadable_icon.LoadableIcon
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
    return cast(void function())g_file_icon_get_type != &gidSymbolNotFound ? g_file_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileIcon self()
  {
    return this;
  }

  /**
      Get builder for [gio.file_icon.FileIcon]
      Returns: New builder object
  */
  static FileIconGidBuilder builder()
  {
    return new FileIconGidBuilder;
  }

  /**
      Get `file` property.
      Returns: The file containing the icon.
  */
  @property gio.file.File file()
  {
    return getFile();
  }

  mixin IconT!();
  mixin LoadableIconT!();

  /**
      Creates a new icon for a file.
  
      Params:
        file = a #GFile.
      Returns: a #GIcon for the given
          file, or null on error.
  */
  this(gio.file.File file)
  {
    GIcon* _cretval;
    _cretval = g_file_icon_new(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GFile associated with the given icon.
      Returns: a #GFile.
  */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = g_file_icon_get_file(cast(GFileIcon*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.file_icon.FileIcon]
class FileIconGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.icon.IconGidBuilderImpl!T, gio.loadable_icon.LoadableIconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();
  mixin LoadableIconGidBuilderT!();

  /**
      Set `file` property.
      Params:
        propval = The file containing the icon.
      Returns: Builder instance for fluent chaining
  */
  T file(gio.file.File propval)
  {
    return setProperty("file", propval);
  }
}

/// Fluent builder for [gio.file_icon.FileIcon]
final class FileIconGidBuilder : FileIconGidBuilderImpl!FileIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileIcon build()
  {
    return new FileIcon(cast(void*)createGObject(FileIcon._getGType), Yes.Take);
  }
}
