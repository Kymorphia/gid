/// Module for [FileFilterInfo] class
module gtk.file_filter_info;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.file_filter_info.FileFilterInfo");

    _cInstance = *cast(GtkFileFilterInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `contains` field.
      Returns: Flags indicating which of the following fields need
          are filled
  */
  @property gtk.types.FileFilterFlags contains()
  {
    return cast(gtk.types.FileFilterFlags)(cast(GtkFileFilterInfo*)this._cPtr).contains;
  }

  /**
      Set `contains` field.
      Params:
        propval = Flags indicating which of the following fields need
            are filled
  */
  @property void contains(gtk.types.FileFilterFlags propval)
  {
    (cast(GtkFileFilterInfo*)this._cPtr).contains = cast(GtkFileFilterFlags)propval;
  }

  /**
      Get `filename` field.
      Returns: the filename of the file being tested
  */
  @property string filename()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).filename);
  }

  /**
      Set `filename` field.
      Params:
        propval = the filename of the file being tested
  */
  @property void filename(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).filename);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)this._cPtr).filename);
  }

  /**
      Get `uri` field.
      Returns: the URI for the file being tested
  */
  @property string uri()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).uri);
  }

  /**
      Set `uri` field.
      Params:
        propval = the URI for the file being tested
  */
  @property void uri(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).uri);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)this._cPtr).uri);
  }

  /**
      Get `displayName` field.
      Returns: the string that will be used to display the file
          in the file chooser
  */
  @property string displayName()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).displayName);
  }

  /**
      Set `displayName` field.
      Params:
        propval = the string that will be used to display the file
            in the file chooser
  */
  @property void displayName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).displayName);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)this._cPtr).displayName);
  }

  /**
      Get `mimeType` field.
      Returns: the mime type of the file
  */
  @property string mimeType()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).mimeType);
  }

  /**
      Set `mimeType` field.
      Params:
        propval = the mime type of the file
  */
  @property void mimeType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)this._cPtr).mimeType);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)this._cPtr).mimeType);
  }
}
