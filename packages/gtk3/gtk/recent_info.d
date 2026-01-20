/// Module for [RecentInfo] class
module gtk.recent_info;

import gdkpixbuf.pixbuf;
import gid.gid;
import gio.app_info;
import gio.icon;
import glib.error;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkRecentInfo-struct contains private data only, and should
    be accessed using the provided API.
    
    #GtkRecentInfo constains all the meta-data
    associated with an entry in the recently used files list.
*/
class RecentInfo : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_recent_info_get_type != &gidSymbolNotFound ? gtk_recent_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentInfo self()
  {
    return this;
  }

  /**
      Creates a #GAppInfo for the specified #GtkRecentInfo
  
      Params:
        appName = the name of the application that should
            be mapped to a #GAppInfo; if null is used then the default
            application for the MIME type is used
      Returns: the newly created #GAppInfo, or null.
          In case of error, error will be set either with a
          `GTK_RECENT_MANAGER_ERROR` or a `G_IO_ERROR`
      Throws: [ErrorWrap]
  */
  gio.app_info.AppInfo createAppInfo(string appName = null)
  {
    GAppInfo* _cretval;
    const(char)* _appName = appName.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_recent_info_create_app_info(cast(GtkRecentInfo*)this._cPtr, _appName, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks whether the resource pointed by info still exists.
      At the moment this check is done only on resources pointing
      to local files.
      Returns: true if the resource exists
  */
  bool exists()
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_info_exists(cast(GtkRecentInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the timestamp (seconds from system’s Epoch) when the resource
      was added to the recently used resources list.
      Returns: the number of seconds elapsed from system’s Epoch when
          the resource was added to the list, or -1 on failure.
  */
  long getAdded()
  {
    long _retval;
    _retval = gtk_recent_info_get_added(cast(GtkRecentInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of days elapsed since the last update
      of the resource pointed by info.
      Returns: a positive integer containing the number of days
          elapsed since the time this resource was last modified
  */
  int getAge()
  {
    int _retval;
    _retval = gtk_recent_info_get_age(cast(GtkRecentInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the data regarding the application that has registered the resource
      pointed by info.
      
      If the command line contains any escape characters defined inside the
      storage specification, they will be expanded.
  
      Params:
        appName = the name of the application that has registered this item
        appExec = return location for the string containing
             the command line
        count = return location for the number of times this item was registered
        time = return location for the timestamp this item was last registered
             for this application
      Returns: true if an application with app_name has registered this
          resource inside the recently used list, or false otherwise. The
          app_exec string is owned by the #GtkRecentInfo and should not be
          modified or freed
  */
  bool getApplicationInfo(string appName, out string appExec, out uint count, out long time)
  {
    bool _retval;
    const(char)* _appName = appName.toCString(No.Alloc);
    char* _appExec;
    _retval = cast(bool)gtk_recent_info_get_application_info(cast(GtkRecentInfo*)this._cPtr, _appName, &_appExec, cast(uint*)&count, cast(long*)&time);
    appExec = _appExec.fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the list of applications that have registered this resource.
      Returns: a newly allocated null-terminated array of strings.
            Use [glib.global.strfreev] to free it.
  */
  string[] getApplications()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = gtk_recent_info_get_applications(cast(GtkRecentInfo*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the (short) description of the resource.
      Returns: the description of the resource. The returned string
          is owned by the recent manager, and should not be freed.
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_recent_info_get_description(cast(GtkRecentInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name of the resource. If none has been defined, the basename
      of the resource is obtained.
      Returns: the display name of the resource. The returned string
          is owned by the recent manager, and should not be freed.
  */
  string getDisplayName()
  {
    const(char)* _cretval;
    _cretval = gtk_recent_info_get_display_name(cast(GtkRecentInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the icon associated to the resource MIME type.
      Returns: a #GIcon containing the icon, or null.
          Use [gobject.object.ObjectWrap.unref] when finished using the icon
  */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_recent_info_get_gicon(cast(GtkRecentInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns all groups registered for the recently used item info.
      The array of returned group names will be null terminated, so
      length might optionally be null.
      Returns: a newly allocated null terminated array of strings.
          Use [glib.global.strfreev] to free it.
  */
  string[] getGroups()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = gtk_recent_info_get_groups(cast(GtkRecentInfo*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Retrieves the icon of size size associated to the resource MIME type.
  
      Params:
        size = the size of the icon in pixels
      Returns: a #GdkPixbuf containing the icon,
            or null. Use [gobject.object.ObjectWrap.unref] when finished using the icon.
  */
  gdkpixbuf.pixbuf.Pixbuf getIcon(int size)
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_recent_info_get_icon(cast(GtkRecentInfo*)this._cPtr, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the MIME type of the resource.
      Returns: the MIME type of the resource. The returned string
          is owned by the recent manager, and should not be freed.
  */
  string getMimeType()
  {
    const(char)* _cretval;
    _cretval = gtk_recent_info_get_mime_type(cast(GtkRecentInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the timestamp (seconds from system’s Epoch) when the meta-data
      for the resource was last modified.
      Returns: the number of seconds elapsed from system’s Epoch when
          the resource was last modified, or -1 on failure.
  */
  long getModified()
  {
    long _retval;
    _retval = gtk_recent_info_get_modified(cast(GtkRecentInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the “private” flag. Resources in the recently used
      list that have this flag set to true should only be displayed by the
      applications that have registered them.
      Returns: true if the private flag was found, false otherwise
  */
  bool getPrivateHint()
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_info_get_private_hint(cast(GtkRecentInfo*)this._cPtr);
    return _retval;
  }

  /**
      Computes a valid UTF-8 string that can be used as the
      name of the item in a menu or list. For example, calling
      this function on an item that refers to
      “file:///foo/bar.txt” will yield “bar.txt”.
      Returns: A newly-allocated string in UTF-8 encoding
          free it with [glib.global.gfree]
  */
  string getShortName()
  {
    char* _cretval;
    _cretval = gtk_recent_info_get_short_name(cast(GtkRecentInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the URI of the resource.
      Returns: the URI of the resource. The returned string is
          owned by the recent manager, and should not be freed.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gtk_recent_info_get_uri(cast(GtkRecentInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a displayable version of the resource’s URI. If the resource
      is local, it returns a local path; if the resource is not local,
      it returns the UTF-8 encoded content of [gtk.recent_info.RecentInfo.getUri].
      Returns: a newly allocated UTF-8 string containing the
          resource’s URI or null. Use [glib.global.gfree] when done using it.
  */
  string getUriDisplay()
  {
    char* _cretval;
    _cretval = gtk_recent_info_get_uri_display(cast(GtkRecentInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the timestamp (seconds from system’s Epoch) when the meta-data
      for the resource was last visited.
      Returns: the number of seconds elapsed from system’s Epoch when
          the resource was last visited, or -1 on failure.
  */
  long getVisited()
  {
    long _retval;
    _retval = gtk_recent_info_get_visited(cast(GtkRecentInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether an application registered this resource using app_name.
  
      Params:
        appName = a string containing an application name
      Returns: true if an application with name app_name was found,
          false otherwise
  */
  bool hasApplication(string appName)
  {
    bool _retval;
    const(char)* _appName = appName.toCString(No.Alloc);
    _retval = cast(bool)gtk_recent_info_has_application(cast(GtkRecentInfo*)this._cPtr, _appName);
    return _retval;
  }

  /**
      Checks whether group_name appears inside the groups
      registered for the recently used item info.
  
      Params:
        groupName = name of a group
      Returns: true if the group was found
  */
  bool hasGroup(string groupName)
  {
    bool _retval;
    const(char)* _groupName = groupName.toCString(No.Alloc);
    _retval = cast(bool)gtk_recent_info_has_group(cast(GtkRecentInfo*)this._cPtr, _groupName);
    return _retval;
  }

  /**
      Checks whether the resource is local or not by looking at the
      scheme of its URI.
      Returns: true if the resource is local
  */
  bool isLocal()
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_info_is_local(cast(GtkRecentInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of the last application that have registered the
      recently used resource represented by info.
      Returns: an application name. Use [glib.global.gfree] to free it.
  */
  string lastApplication()
  {
    char* _cretval;
    _cretval = gtk_recent_info_last_application(cast(GtkRecentInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks whether two #GtkRecentInfo-struct point to the same
      resource.
  
      Params:
        infoB = a #GtkRecentInfo
      Returns: true if both #GtkRecentInfo-struct point to the same
          resource, false otherwise
  */
  bool match(gtk.recent_info.RecentInfo infoB)
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_info_match(cast(GtkRecentInfo*)this._cPtr, infoB ? cast(GtkRecentInfo*)infoB._cPtr(No.Dup) : null);
    return _retval;
  }
}
