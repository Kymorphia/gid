/// Module for [RecentFilterInfo] class
module gtk.recent_filter_info;

public import gid.basictypes;
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

  /**
      Create a `recent_filter_info.RecentFilterInfo` wrap type.
      Params:
        contains = #GtkRecentFilterFlags to indicate which fields are set.
        uri = The URI of the file being tested.
        displayName = The string that will be used to display
             the file in the recent chooser.
        mimeType = MIME type of the file.
        age = The number of days elapsed since the file has been
             registered.
  */
  this(gtk.types.RecentFilterFlags contains = gtk.types.RecentFilterFlags.init, string uri = string.init, string displayName = string.init, string mimeType = string.init, int age = int.init) nothrow
  {
    this.contains = contains;
    this.uri = uri;
    this.displayName = displayName;
    this.mimeType = mimeType;
    this.age = age;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkRecentFilterInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `contains` field.
      Returns: #GtkRecentFilterFlags to indicate which fields are set.
  */
  @property gtk.types.RecentFilterFlags contains() nothrow
  {
    return cast(gtk.types.RecentFilterFlags)(cast(GtkRecentFilterInfo*)this._cPtr).contains;
  }

  /**
      Set `contains` field.
      Params:
        propval = #GtkRecentFilterFlags to indicate which fields are set.
  */
  @property void contains(gtk.types.RecentFilterFlags propval) nothrow
  {
    (cast(GtkRecentFilterInfo*)this._cPtr).contains = cast(GtkRecentFilterFlags)propval;
  }

  /**
      Get `uri` field.
      Returns: The URI of the file being tested.
  */
  @property string uri() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).uri);
  }

  /**
      Set `uri` field.
      Params:
        propval = The URI of the file being tested.
  */
  @property void uri(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).uri);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)this._cPtr).uri);
  }

  /**
      Get `displayName` field.
      Returns: The string that will be used to display
           the file in the recent chooser.
  */
  @property string displayName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).displayName);
  }

  /**
      Set `displayName` field.
      Params:
        propval = The string that will be used to display
             the file in the recent chooser.
  */
  @property void displayName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).displayName);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)this._cPtr).displayName);
  }

  /**
      Get `mimeType` field.
      Returns: MIME type of the file.
  */
  @property string mimeType() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).mimeType);
  }

  /**
      Set `mimeType` field.
      Params:
        propval = MIME type of the file.
  */
  @property void mimeType(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)this._cPtr).mimeType);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)this._cPtr).mimeType);
  }

  /**
      Get `applications` field.
      Returns: The list of
           applications that have registered the file.
  */
  @property string[] applications() nothrow
  {
    uint len;
    if ((cast(GtkRecentFilterInfo*)this._cPtr).applications)
    {
      for (; (cast(GtkRecentFilterInfo*)this._cPtr).applications[len] !is null; len++)
      {
      }
    }

    auto _retval = new string[](len);
    foreach (i; 0 .. len)
      _retval[i] = (cast(GtkRecentFilterInfo*)this._cPtr).applications[i].fromCString;
    return _retval;
  }

  /**
      Get `groups` field.
      Returns: The groups to which
           the file belongs to.
  */
  @property string[] groups() nothrow
  {
    uint len;
    if ((cast(GtkRecentFilterInfo*)this._cPtr).groups)
    {
      for (; (cast(GtkRecentFilterInfo*)this._cPtr).groups[len] !is null; len++)
      {
      }
    }

    auto _retval = new string[](len);
    foreach (i; 0 .. len)
      _retval[i] = (cast(GtkRecentFilterInfo*)this._cPtr).groups[i].fromCString;
    return _retval;
  }

  /**
      Get `age` field.
      Returns: The number of days elapsed since the file has been
           registered.
  */
  @property int age() nothrow
  {
    return (cast(GtkRecentFilterInfo*)this._cPtr).age;
  }

  /**
      Set `age` field.
      Params:
        propval = The number of days elapsed since the file has been
             registered.
  */
  @property void age(int propval) nothrow
  {
    (cast(GtkRecentFilterInfo*)this._cPtr).age = propval;
  }
}
