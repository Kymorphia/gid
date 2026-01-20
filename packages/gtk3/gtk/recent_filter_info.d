/// Module for [RecentFilterInfo] class
module gtk.recent_filter_info;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A GtkRecentFilterInfo struct is used
    to pass information about the tested file to [gtk.recent_filter.RecentFilter.filter].
*/
class RecentFilterInfo
{
  GtkRecentFilterInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.recent_filter_info.RecentFilterInfo");

    _cInstance = *cast(GtkRecentFilterInfo*)ptr;

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
      Returns: #GtkRecentFilterFlags to indicate which fields are set.
  */
  @property gtk.types.RecentFilterFlags contains()
  {
    return cast(gtk.types.RecentFilterFlags)(cast(GtkRecentFilterInfo*)this._cPtr).contains;
  }

  /**
      Set `contains` field.
      Params:
        propval = #GtkRecentFilterFlags to indicate which fields are set.
  */
  @property void contains(gtk.types.RecentFilterFlags propval)
  {
    (cast(GtkRecentFilterInfo*)this._cPtr).contains = cast(GtkRecentFilterFlags)propval;
  }

  /**
      Get `uri` field.
      Returns: The URI of the file being tested.
  */
  @property string uri()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).uri);
  }

  /**
      Set `uri` field.
      Params:
        propval = The URI of the file being tested.
  */
  @property void uri(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).uri);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)this._cPtr).uri);
  }

  /**
      Get `displayName` field.
      Returns: The string that will be used to display
           the file in the recent chooser.
  */
  @property string displayName()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).displayName);
  }

  /**
      Set `displayName` field.
      Params:
        propval = The string that will be used to display
             the file in the recent chooser.
  */
  @property void displayName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).displayName);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)this._cPtr).displayName);
  }

  /**
      Get `mimeType` field.
      Returns: MIME type of the file.
  */
  @property string mimeType()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).mimeType);
  }

  /**
      Set `mimeType` field.
      Params:
        propval = MIME type of the file.
  */
  @property void mimeType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).mimeType);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)this._cPtr).mimeType);
  }

  /**
      Get `age` field.
      Returns: The number of days elapsed since the file has been
           registered.
  */
  @property int age()
  {
    return (cast(GtkRecentFilterInfo*)this._cPtr).age;
  }

  /**
      Set `age` field.
      Params:
        propval = The number of days elapsed since the file has been
             registered.
  */
  @property void age(int propval)
  {
    (cast(GtkRecentFilterInfo*)this._cPtr).age = propval;
  }
}
