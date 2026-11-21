/// Module for [FileIcon] class
module gid.gio2.file_icon;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.file;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.loadable_icon;
import gid.gio2.loadable_icon_mixin;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.file_icon.FileIcon] specifies an icon by pointing to an image file
    to be used as icon.
    
    It implements [gid.gio2.loadable_icon.LoadableIcon].
*/
class FileIcon : gid.gobject2.object.ObjectWrap, gid.gio2.icon.Icon, gid.gio2.loadable_icon.LoadableIcon
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
    return cast(void function())g_file_icon_get_type != &gidSymbolNotFound ? g_file_icon_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFileIcon";
  }

  /** Returns `this`, for use in `with` statements. */
  override FileIcon self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.file_icon.FileIcon]
      Returns: New builder object
  */
  static FileIconGidBuilder builder() nothrow
  {
    return new FileIconGidBuilder;
  }

  /**
      Get `file` property.
      Returns: The file containing the icon.
  */
  @property gid.gio2.file.File file() nothrow
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
  this(gid.gio2.file.File file) nothrow
  {
    GIcon* _cretval;
    _cretval = g_file_icon_new(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GFile associated with the given icon.
      Returns: a #GFile.
  */
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = g_file_icon_get_file(cast(GFileIcon*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.file_icon.FileIcon]
class FileIconGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.icon.IconGidBuilderImpl!T, gid.gio2.loadable_icon.LoadableIconGidBuilderImpl!T
{

  mixin IconGidBuilderT!();
  mixin LoadableIconGidBuilderT!();

  /**
      Set `file` property.
      Params:
        propval = The file containing the icon.
      Returns: Builder instance for fluent chaining
  */
  T file(gid.gio2.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }
}

/// Fluent builder for [gid.gio2.file_icon.FileIcon]
final class FileIconGidBuilder : FileIconGidBuilderImpl!FileIconGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FileIcon build() nothrow
  {
    return new FileIcon(cast(void*)createGObject(FileIcon._getGType), Yes.Take);
  }
}
