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
class FileFilterInfo : StructWrap!(GtkFileFilterInfo)
{
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
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
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

  private const(char)* _filenameRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("filename"))
      return;

    _filenameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkFileFilterInfo*)this._cPtr).filename = cast(const(char)*)_filenameRef;
  }

  private const(char)* _uriRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("uri"))
      return;

    _uriRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkFileFilterInfo*)this._cPtr).uri = cast(const(char)*)_uriRef;
  }

  private const(char)* _displayNameRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("displayName"))
      return;

    _displayNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkFileFilterInfo*)this._cPtr).displayName = cast(const(char)*)_displayNameRef;
  }

  private const(char)* _mimeTypeRef; // Keeps borrowed GC string alive

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
    if (_refuseBorrowedStore("mimeType"))
      return;

    _mimeTypeRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkFileFilterInfo*)this._cPtr).mimeType = cast(const(char)*)_mimeTypeRef;
  }
}
