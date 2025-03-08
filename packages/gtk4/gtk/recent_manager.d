module gtk.recent_manager;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.recent_data;
import gtk.recent_info;
import gtk.types;

/**
    [gtk.recent_manager.RecentManager] manages and looks up recently used files.
  
  Each recently used file is identified by its URI, and has meta-data
  associated to it, like the names and command lines of the applications
  that have registered it, the number of time each application has
  registered the same file, the mime type of the file and whether
  the file should be displayed only by the applications that have
  registered it.
  
  The recently used files list is per user.
  
  [gtk.recent_manager.RecentManager] acts like a database of all the recently
  used files. You can create new [gtk.recent_manager.RecentManager] objects, but
  it is more efficient to use the default manager created by GTK.
  
  Adding a new recently used file is as simple as:
  
  ```c
  GtkRecentManager *manager;
  
  manager = gtk_recent_manager_get_default ();
  gtk_recent_manager_add_item (manager, file_uri);
  ```
  
  The [gtk.recent_manager.RecentManager] will try to gather all the needed information
  from the file itself through GIO.
  
  Looking up the meta-data associated with a recently used file
  given its URI requires calling [gtk.recent_manager.RecentManager.lookupItem]:
  
  ```c
  GtkRecentManager *manager;
  GtkRecentInfo *info;
  GError *error = NULL;
  
  manager = gtk_recent_manager_get_default ();
  info = gtk_recent_manager_lookup_item (manager, file_uri, &error);
  if (error)
    {
      g_warning ("Could not find the file: %s", error->message);
      g_error_free (error);
    }
  else
   {
     // Use the info object
     gtk_recent_info_unref (info);
   }
  ```
  
  In order to retrieve the list of recently used files, you can use
  [gtk.recent_manager.RecentManager.getItems], which returns a list of
  [gtk.recent_info.RecentInfo].
  
  Note that the maximum age of the recently used files list is
  controllable through the `property@Gtk.Settings:gtk-recent-files-max-age`
  property.
*/
class RecentManager : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_recent_manager_get_type != &gidSymbolNotFound ? gtk_recent_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new recent manager object.
    
    Recent manager objects are used to handle the list of recently used
    resources. A [gtk.recent_manager.RecentManager] object monitors the recently used
    resources list, and emits the [gtk.recent_manager.RecentManager.changed]
    signal each time something inside the list changes.
    
    [gtk.recent_manager.RecentManager] objects are expensive: be sure to create them
    only when needed. You should use [gtk.recent_manager.RecentManager.getDefault]
    instead.
    Returns:     A newly created [gtk.recent_manager.RecentManager] object
  */
  this()
  {
    GtkRecentManager* _cretval;
    _cretval = gtk_recent_manager_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets a unique instance of [gtk.recent_manager.RecentManager] that you can share
    in your application without caring about memory management.
    Returns:     A unique [gtk.recent_manager.RecentManager]. Do not ref or
        unref it.
  */
  static gtk.recent_manager.RecentManager getDefault()
  {
    GtkRecentManager* _cretval;
    _cretval = gtk_recent_manager_get_default();
    auto _retval = ObjectG.getDObject!(gtk.recent_manager.RecentManager)(cast(GtkRecentManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a new resource, pointed by uri, into the recently used
    resources list, using the metadata specified inside the
    [gtk.recent_data.RecentData] passed in recent_data.
    
    The passed URI will be used to identify this resource inside the
    list.
    
    In order to register the new recently used resource, metadata about
    the resource must be passed as well as the URI; the metadata is
    stored in a [gtk.recent_data.RecentData], which must contain the MIME
    type of the resource pointed by the URI; the name of the application
    that is registering the item, and a command line to be used when
    launching the item.
    
    Optionally, a [gtk.recent_data.RecentData] might contain a UTF-8 string
    to be used when viewing the item instead of the last component of
    the URI; a short description of the item; whether the item should
    be considered private - that is, should be displayed only by the
    applications that have registered it.
    Params:
      uri =       a valid URI
      recentData =       metadata of the resource
    Returns:     true if the new item was successfully added to the
        recently used resources list, false otherwise
  */
  bool addFull(string uri, gtk.recent_data.RecentData recentData)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = gtk_recent_manager_add_full(cast(GtkRecentManager*)cPtr, _uri, recentData ? cast(const(GtkRecentData)*)recentData.cPtr : null);
    return _retval;
  }

  /**
      Adds a new resource, pointed by uri, into the recently used
    resources list.
    
    This function automatically retrieves some of the needed
    metadata and setting other metadata to common default values;
    it then feeds the data to [gtk.recent_manager.RecentManager.addFull].
    
    See [gtk.recent_manager.RecentManager.addFull] if you want to explicitly
    define the metadata for the resource pointed by uri.
    Params:
      uri =       a valid URI
    Returns:     true if the new item was successfully added
        to the recently used resources list
  */
  bool addItem(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = gtk_recent_manager_add_item(cast(GtkRecentManager*)cPtr, _uri);
    return _retval;
  }

  /**
      Gets the list of recently used resources.
    Returns:     a list of
        newly allocated `GtkRecentInfo objects`. Use
        [gtk.recent_info.RecentInfo.unref] on each item inside the list, and then
        free the list itself using [glib.list.List.free].
  */
  gtk.recent_info.RecentInfo[] getItems()
  {
    GList* _cretval;
    _cretval = gtk_recent_manager_get_items(cast(GtkRecentManager*)cPtr);
    auto _retval = gListToD!(gtk.recent_info.RecentInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Checks whether there is a recently used resource registered
    with uri inside the recent manager.
    Params:
      uri =       a URI
    Returns:     true if the resource was found, false otherwise
  */
  bool hasItem(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = gtk_recent_manager_has_item(cast(GtkRecentManager*)cPtr, _uri);
    return _retval;
  }

  /**
      Searches for a URI inside the recently used resources list, and
    returns a [gtk.recent_info.RecentInfo] containing information about the resource
    like its MIME type, or its display name.
    Params:
      uri =       a URI
    Returns:     a [gtk.recent_info.RecentInfo] containing information
        about the resource pointed by uri, or null if the URI was
        not registered in the recently used resources list. Free with
        [gtk.recent_info.RecentInfo.unref].
  */
  gtk.recent_info.RecentInfo lookupItem(string uri)
  {
    GtkRecentInfo* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_recent_manager_lookup_item(cast(GtkRecentManager*)cPtr, _uri, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new gtk.recent_info.RecentInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Changes the location of a recently used resource from uri to new_uri.
    
    Please note that this function will not affect the resource pointed
    by the URIs, but only the URI used in the recently used resources list.
    Params:
      uri =       the URI of a recently used resource
      newUri =       the new URI of the recently used resource, or
           null to remove the item pointed by uri in the list
    Returns:     true on success
  */
  bool moveItem(string uri, string newUri = null)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _newUri = newUri.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_recent_manager_move_item(cast(GtkRecentManager*)cPtr, _uri, _newUri, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Purges every item from the recently used resources list.
    Returns:     the number of items that have been removed from the
        recently used resources list
  */
  int purgeItems()
  {
    int _retval;
    GError *_err;
    _retval = gtk_recent_manager_purge_items(cast(GtkRecentManager*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Removes a resource pointed by uri from the recently used resources
    list handled by a recent manager.
    Params:
      uri =       the URI of the item you wish to remove
    Returns:     true if the item pointed by uri has been successfully
        removed by the recently used resources list, and false otherwise
  */
  bool removeItem(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = gtk_recent_manager_remove_item(cast(GtkRecentManager*)cPtr, _uri, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Emitted when the current recently used resources manager changes
    its contents.
    
    This can happen either by calling [gtk.recent_manager.RecentManager.addItem]
    or by another application.
  
    ## Parameters
    $(LIST
      * $(B recentManager) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(gtk.recent_manager.RecentManager recentManager);

  /** ditto */
  alias ChangedCallbackFunc = void function(gtk.recent_manager.RecentManager recentManager);

  /**
    Connect to Changed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto recentManager = getVal!(gtk.recent_manager.RecentManager)(_paramVals);
      _dClosure.dlg(recentManager);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
