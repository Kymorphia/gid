/// Module for [RecentManager] class
module gid.gtk4.recent_manager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.recent_data;
import gid.gtk4.recent_info;
import gid.gtk4.types;

/**
    Manages and looks up recently used files.
    
    Each recently used file is identified by its URI, and has meta-data
    associated to it, like the names and command lines of the applications
    that have registered it, the number of time each application has
    registered the same file, the mime type of the file and whether
    the file should be displayed only by the applications that have
    registered it.
    
    The recently used files list is per user.
    
    [gid.gtk4.recent_manager.RecentManager] acts like a database of all the recently
    used files. You can create new [gid.gtk4.recent_manager.RecentManager] objects, but
    it is more efficient to use the default manager created by GTK.
    
    Adding a new recently used file is as simple as:
    
    ```c
    GtkRecentManager *manager;
    
    manager = gtk_recent_manager_get_default ();
    gtk_recent_manager_add_item (manager, file_uri);
    ```
    
    The [gid.gtk4.recent_manager.RecentManager] will try to gather all the needed information
    from the file itself through GIO.
    
    Looking up the meta-data associated with a recently used file
    given its URI requires calling [gid.gtk4.recent_manager.RecentManager.lookupItem]:
    
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
    [gid.gtk4.recent_manager.RecentManager.getItems], which returns a list of
    [gid.gtk4.recent_info.RecentInfo].
    
    Note that the maximum age of the recently used files list is
    controllable through the [gid.gtk4.settings.Settings.gtkRecentFilesMaxAge]
    property.
*/
class RecentManager : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_recent_manager_get_type != &gidSymbolNotFound ? gtk_recent_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRecentManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.recent_manager.RecentManager]
      Returns: New builder object
  */
  static RecentManagerGidBuilder builder() nothrow
  {
    return new RecentManagerGidBuilder;
  }

  /**
      Get `filename` property.
      Returns: The full path to the file to be used to store and read the
        recently used resources list
  */
  @property string filename() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("filename");
  }

  /**
      Get `size` property.
      Returns: The size of the recently used resources list.
  */
  @property int size() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("size");
  }

  /**
      Creates a new recent manager object.
      
      Recent manager objects are used to handle the list of recently used
      resources. A [gid.gtk4.recent_manager.RecentManager] object monitors the recently used
      resources list, and emits the [gid.gtk4.recent_manager.RecentManager.changed]
      signal each time something inside the list changes.
      
      [gid.gtk4.recent_manager.RecentManager] objects are expensive: be sure to create them
      only when needed. You should use [gid.gtk4.recent_manager.RecentManager.getDefault]
      instead.
      Returns: A newly created [gid.gtk4.recent_manager.RecentManager] object
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkRecentManager* _cretval;
      _cretval = gtk_recent_manager_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets a unique instance of [gid.gtk4.recent_manager.RecentManager] that you can share
      in your application without caring about memory management.
      Returns: A unique [gid.gtk4.recent_manager.RecentManager]. Do not ref or
          unref it.
  */
  static gid.gtk4.recent_manager.RecentManager getDefault() nothrow
  {
    GtkRecentManager* _cretval;
    _cretval = gtk_recent_manager_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.recent_manager.RecentManager)(cast(GtkRecentManager*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncChanged()
  {
    auto _klass = cast(GtkRecentManagerClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GtkRecentManager*)this._cPtr);
  }

  /**
      Adds a new resource, pointed by uri, into the recently used
      resources list, using the metadata specified inside the
      [gid.gtk4.recent_data.RecentData] passed in recent_data.
      
      The passed URI will be used to identify this resource inside the
      list.
      
      In order to register the new recently used resource, metadata about
      the resource must be passed as well as the URI; the metadata is
      stored in a [gid.gtk4.recent_data.RecentData], which must contain the MIME
      type of the resource pointed by the URI; the name of the application
      that is registering the item, and a command line to be used when
      launching the item.
      
      Optionally, a [gid.gtk4.recent_data.RecentData] might contain a UTF-8 string
      to be used when viewing the item instead of the last component of
      the URI; a short description of the item; whether the item should
      be considered private - that is, should be displayed only by the
      applications that have registered it.
  
      Params:
        uri = a valid URI
        recentData = metadata of the resource
      Returns: true if the new item was successfully added to the
          recently used resources list, false otherwise
  */
  bool addFull(string uri, gid.gtk4.recent_data.RecentData recentData) nothrow
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_recent_manager_add_full(cast(GtkRecentManager*)this._cPtr, _uri, recentData ? cast(const(GtkRecentData)*)recentData._cPtr : null);
    return _retval;
  }

  /**
      Adds a new resource, pointed by uri, into the recently used
      resources list.
      
      This function automatically retrieves some of the needed
      metadata and setting other metadata to common default values;
      it then feeds the data to [gid.gtk4.recent_manager.RecentManager.addFull].
      
      See [gid.gtk4.recent_manager.RecentManager.addFull] if you want to explicitly
      define the metadata for the resource pointed by uri.
  
      Params:
        uri = a valid URI
      Returns: true if the new item was successfully added
          to the recently used resources list
  */
  bool addItem(string uri) nothrow
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_recent_manager_add_item(cast(GtkRecentManager*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Gets the list of recently used resources.
      Returns: a list of
          newly allocated `GtkRecentInfo objects`. Use
          [gid.gtk4.recent_info.RecentInfo.unref] on each item inside the list, and then
          free the list itself using [gid.glib2.list.List.free].
  */
  gid.gtk4.recent_info.RecentInfo[] getItems() nothrow
  {
    GList* _cretval;
    _cretval = gtk_recent_manager_get_items(cast(GtkRecentManager*)this._cPtr);
    auto _retval = gListToD!(gid.gtk4.recent_info.RecentInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Checks whether there is a recently used resource registered
      with uri inside the recent manager.
  
      Params:
        uri = a URI
      Returns: true if the resource was found, false otherwise
  */
  bool hasItem(string uri) nothrow
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_recent_manager_has_item(cast(GtkRecentManager*)this._cPtr, _uri);
    return _retval;
  }

  /**
      Searches for a URI inside the recently used resources list, and
      returns a [gid.gtk4.recent_info.RecentInfo] containing information about the resource
      like its MIME type, or its display name.
  
      Params:
        uri = a URI
      Returns: a [gid.gtk4.recent_info.RecentInfo] containing information
          about the resource pointed by uri, or null if the URI was
          not registered in the recently used resources list. Free with
          [gid.gtk4.recent_info.RecentInfo.unref].
      Throws: [ErrorWrap]
  */
  gid.gtk4.recent_info.RecentInfo lookupItem(string uri)
  {
    GtkRecentInfo* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = gtk_recent_manager_lookup_item(cast(GtkRecentManager*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.gtk4.recent_info.RecentInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Changes the location of a recently used resource from uri to new_uri.
      
      Please note that this function will not affect the resource pointed
      by the URIs, but only the URI used in the recently used resources list.
  
      Params:
        uri = the URI of a recently used resource
        newUri = the new URI of the recently used resource, or
             null to remove the item pointed by uri in the list
      Returns: true on success
      Throws: [ErrorWrap]
  */
  bool moveItem(string uri, string newUri = null)
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    const(char)* _newUri = newUri.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _retval = cast(bool)gtk_recent_manager_move_item(cast(GtkRecentManager*)this._cPtr, _uri, _newUri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Purges every item from the recently used resources list.
      Returns: the number of items that have been removed from the
          recently used resources list
      Throws: [ErrorWrap]
  */
  int purgeItems()
  {
    int _retval;
    GError *_err;
    _retval = gtk_recent_manager_purge_items(cast(GtkRecentManager*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Removes a resource pointed by uri from the recently used resources
      list handled by a recent manager.
  
      Params:
        uri = the URI of the item you wish to remove
      Returns: true if the item pointed by uri has been successfully
          removed by the recently used resources list, and false otherwise
      Throws: [ErrorWrap]
  */
  bool removeItem(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)gtk_recent_manager_remove_item(cast(GtkRecentManager*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the current recently used resources manager changes
        its contents.
        
        This can happen either by calling [gid.gtk4.recent_manager.RecentManager.addItem]
        or by another application.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.recent_manager.RecentManager recentManager)`
  
          `recentManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.recent_manager.RecentManager)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.recent_manager.RecentManager.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RecentManager
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.recent_manager.RecentManager), T.stringof ~ " is not derived from gid.gtk4.recent_manager.RecentManager");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gtk4.recent_manager.RecentManager))
      _installVfunc(klass, "changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkRecentManagerClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkRecentManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.recent_manager.RecentManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(manager);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.recent_manager.RecentManager.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.recent_manager.RecentManager]
class RecentManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `filename` property.
      Params:
        propval = The full path to the file to be used to store and read the
          recently used resources list
      Returns: Builder instance for fluent chaining
  */
  T filename(string propval) nothrow
  {
    return setProperty("filename", propval);
  }
}

/// Fluent builder for [gid.gtk4.recent_manager.RecentManager]
final class RecentManagerGidBuilder : RecentManagerGidBuilderImpl!RecentManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecentManager build() nothrow
  {
    return new RecentManager(cast(void*)createGObject(RecentManager._getGType), Yes.Take);
  }
}
