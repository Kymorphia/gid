/// Module for [FileFilterInfo] class
module gtk.file_filter_info;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkFileFilterInfo-struct is used to pass information about the
    tested file to [gtk.file_filter.FileFilter.filter].
*/
class FileFilterInfo
{
  GtkFileFilterInfo _cInstance;

  /**
      Create a `file_filter_info.FileFilterInfo` wrap type.
      Params:
        contains = Flags indicating which of the following fields need
            are filled
        filename = the filename of the file being tested
        uri = the URI for the file being tested
        displayName = the string that will be used to display the file
            in the file chooser
        mimeType = the mime type of the file
  */
  this(gtk.types.FileFilterFlags contains = gtk.types.FileFilterFlags.init, string filename = string.init, string uri = string.init, string displayName = string.init, string mimeType = string.init) nothrow
  {
    this.contains = contains;
    this.filename = filename;
    this.uri = uri;
    this.displayName = displayName;
    this.mimeType = mimeType;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkFileFilterInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `contains` field.
      Returns: Flags indicating which of the following fields need
          are filled
  */
  @property gtk.types.FileFilterFlags contains() nothrow
  {
    return cast(gtk.types.FileFilterFlags)(cast(GtkFileFilterInfo*)this._cPtr).contains;
  }

  /**
      Set `contains` field.
      Params:
        propval = Flags indicating which of the following fields need
            are filled
  */
  @property void contains(gtk.types.FileFilterFlags propval) nothrow
  {
    (cast(GtkFileFilterInfo*)this._cPtr).contains = cast(GtkFileFilterFlags)propval;
  }

  /**
      Get `filename` field.
      Returns: the filename of the file being tested
  */
  @property string filename() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).filename);
  }

  /**
      Set `filename` field.
      Params:
        propval = the filename of the file being tested
  */
  @property void filename(string propval) nothrow
  {
    (cast(GtkFileFilterInfo*)this._cPtr).filename = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `uri` field.
      Returns: the URI for the file being tested
  */
  @property string uri() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).uri);
  }

  /**
      Set `uri` field.
      Params:
        propval = the URI for the file being tested
  */
  @property void uri(string propval) nothrow
  {
    (cast(GtkFileFilterInfo*)this._cPtr).uri = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `displayName` field.
      Returns: the string that will be used to display the file
          in the file chooser
  */
  @property string displayName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).displayName);
  }

  /**
      Set `displayName` field.
      Params:
        propval = the string that will be used to display the file
            in the file chooser
  */
  @property void displayName(string propval) nothrow
  {
    (cast(GtkFileFilterInfo*)this._cPtr).displayName = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `mimeType` field.
      Returns: the mime type of the file
  */
  @property string mimeType() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).mimeType);
  }

  /**
      Set `mimeType` field.
      Params:
        propval = the mime type of the file
  */
  @property void mimeType(string propval) nothrow
  {
    (cast(GtkFileFilterInfo*)this._cPtr).mimeType = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
