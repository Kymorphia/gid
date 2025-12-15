/// Module for [AccelMap] class
module gtk.accel_map;

import gdk.types;
import gid.gid;
import glib.scanner;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Accelerator maps are used to define runtime configurable accelerators.
    Functions for manipulating them are are usually used by higher level
    convenience mechanisms like #GtkUIManager and are thus considered
    “low-level”. You’ll want to use them if you’re manually creating menus that
    should have user-configurable accelerators.
    
    An accelerator is uniquely defined by:
    $(LIST
      * accelerator path
      * accelerator key
      * accelerator modifiers
    )
      
    The accelerator path must consist of
    “<WINDOWTYPE>/Category1/Category2/.../Action”, where WINDOWTYPE
    should be a unique application-specific identifier that corresponds
    to the kind of window the accelerator is being used in, e.g.
    “Gimp-Image”, “Abiword-Document” or “Gnumeric-Settings”.
    The “Category1/.../Action” portion is most appropriately chosen by
    the action the accelerator triggers, i.e. for accelerators on menu
    items, choose the item’s menu path, e.g. “File/Save As”,
    “Image/View/Zoom” or “Edit/Select All”. So a full valid accelerator
    path may look like: “<Gimp-Toolbox>/File/Dialogs/Tool Options...”.
    
    All accelerators are stored inside one global #GtkAccelMap that can
    be obtained using [gtk.accel_map.AccelMap.get]. See
    [Monitoring changes][monitoring-changes] for additional
    details.
    
    # Manipulating accelerators
    
    New accelerators can be added using [gtk.accel_map.AccelMap.addEntry].
    To search for specific accelerator, use [gtk.accel_map.AccelMap.lookupEntry].
    Modifications of existing accelerators should be done using
    [gtk.accel_map.AccelMap.changeEntry].
    
    In order to avoid having some accelerators changed, they can be
    locked using [gtk.accel_map.AccelMap.lockPath]. Unlocking is done using
    [gtk.accel_map.AccelMap.unlockPath].
    
    # Saving and loading accelerator maps
    
    Accelerator maps can be saved to and loaded from some external
    resource. For simple saving and loading from file,
    [gtk.accel_map.AccelMap.save] and [gtk.accel_map.AccelMap.load] are provided.
    Saving and loading can also be done by providing file descriptor
    to [gtk.accel_map.AccelMap.saveFd] and [gtk.accel_map.AccelMap.loadFd].
    
    # Monitoring changes
    
    #GtkAccelMap object is only useful for monitoring changes of
    accelerators. By connecting to #GtkAccelMap::changed signal, one
    can monitor changes of all accelerators. It is also possible to
    monitor only single accelerator path by using it as a detail of
    the #GtkAccelMap::changed signal.
*/
class AccelMap : gobject.object.ObjectWrap
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
    return cast(void function())gtk_accel_map_get_type != &gidSymbolNotFound ? gtk_accel_map_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AccelMap self()
  {
    return this;
  }

  /**
      Registers a new accelerator with the global accelerator map.
      This function should only be called once per accel_path
      with the canonical accel_key and accel_mods for this path.
      To change the accelerator during runtime programatically, use
      [gtk.accel_map.AccelMap.changeEntry].
      
      Set accel_key and accel_mods to 0 to request a removal of
      the accelerator.
      
      Note that accel_path string will be stored in a #GQuark. Therefore, if you
      pass a static string, you can save some memory by interning it first with
      [glib.global.internStaticString].
  
      Params:
        accelPath = valid accelerator path
        accelKey = the accelerator key
        accelMods = the accelerator modifiers
  */
  static void addEntry(string accelPath, uint accelKey, gdk.types.ModifierType accelMods)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_accel_map_add_entry(_accelPath, accelKey, accelMods);
  }

  /**
      Adds a filter to the global list of accel path filters.
      
      Accel map entries whose accel path matches one of the filters
      are skipped by [gtk.accel_map.AccelMap.foreach_].
      
      This function is intended for GTK+ modules that create their own
      menus, but don’t want them to be saved into the applications accelerator
      map dump.
  
      Params:
        filterPattern = a pattern (see #GPatternSpec)
  */
  static void addFilter(string filterPattern)
  {
    const(char)* _filterPattern = filterPattern.toCString(No.Alloc);
    gtk_accel_map_add_filter(_filterPattern);
  }

  /**
      Changes the accel_key and accel_mods currently associated with accel_path.
      Due to conflicts with other accelerators, a change may not always be possible,
      replace indicates whether other accelerators may be deleted to resolve such
      conflicts. A change will only occur if all conflicts could be resolved (which
      might not be the case if conflicting accelerators are locked). Successful
      changes are indicated by a true return value.
      
      Note that accel_path string will be stored in a #GQuark. Therefore, if you
      pass a static string, you can save some memory by interning it first with
      [glib.global.internStaticString].
  
      Params:
        accelPath = a valid accelerator path
        accelKey = the new accelerator key
        accelMods = the new accelerator modifiers
        replace = true if other accelerators may be deleted upon conflicts
      Returns: true if the accelerator could be changed, false otherwise
  */
  static bool changeEntry(string accelPath, uint accelKey, gdk.types.ModifierType accelMods, bool replace)
  {
    bool _retval;
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    _retval = cast(bool)gtk_accel_map_change_entry(_accelPath, accelKey, accelMods, replace);
    return _retval;
  }

  /**
      Loops over the entries in the accelerator map whose accel path
      doesn’t match any of the filters added with [gtk.accel_map.AccelMap.addFilter],
      and execute foreach_func on each. The signature of foreach_func is
      that of #GtkAccelMapForeach, the changed parameter indicates whether
      this accelerator was changed during runtime (thus, would need
      saving during an accelerator map dump).
  
      Params:
        data = data to be passed into foreach_func
        foreachFunc = function to be executed for each accel
                         map entry which is not filtered out
  */
  static void foreach_(void* data, gtk.types.AccelMapForeach foreachFunc)
  {
    extern(C) void _foreachFuncCallback(void* data, const(char)* accelPath, uint accelKey, GdkModifierType accelMods, gboolean changed)
    {
      auto _dlg = cast(gtk.types.AccelMapForeach*)data;
      string _accelPath = accelPath.fromCString(No.Free);

      (*_dlg)(_accelPath, accelKey, accelMods, cast(bool)changed);
    }
    auto _foreachFuncCB = foreachFunc ? &_foreachFuncCallback : null;
    gtk_accel_map_foreach(data, _foreachFuncCB);
  }

  /**
      Loops over all entries in the accelerator map, and execute
      foreach_func on each. The signature of foreach_func is that of
      #GtkAccelMapForeach, the changed parameter indicates whether
      this accelerator was changed during runtime (thus, would need
      saving during an accelerator map dump).
  
      Params:
        data = data to be passed into foreach_func
        foreachFunc = function to be executed for each accel
                         map entry
  */
  static void foreachUnfiltered(void* data, gtk.types.AccelMapForeach foreachFunc)
  {
    extern(C) void _foreachFuncCallback(void* data, const(char)* accelPath, uint accelKey, GdkModifierType accelMods, gboolean changed)
    {
      auto _dlg = cast(gtk.types.AccelMapForeach*)data;
      string _accelPath = accelPath.fromCString(No.Free);

      (*_dlg)(_accelPath, accelKey, accelMods, cast(bool)changed);
    }
    auto _foreachFuncCB = foreachFunc ? &_foreachFuncCallback : null;
    gtk_accel_map_foreach_unfiltered(data, _foreachFuncCB);
  }

  /**
      Gets the singleton global #GtkAccelMap object. This object
      is useful only for notification of changes to the accelerator
      map via the ::changed signal; it isn’t a parameter to the
      other accelerator map functions.
      Returns: the global #GtkAccelMap object
  */
  static gtk.accel_map.AccelMap get()
  {
    GtkAccelMap* _cretval;
    _cretval = gtk_accel_map_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.accel_map.AccelMap)(cast(GtkAccelMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Parses a file previously saved with [gtk.accel_map.AccelMap.save] for
      accelerator specifications, and propagates them accordingly.
  
      Params:
        fileName = a file containing accelerator specifications,
            in the GLib file name encoding
  */
  static void load(string fileName)
  {
    const(char)* _fileName = fileName.toCString(No.Alloc);
    gtk_accel_map_load(_fileName);
  }

  /**
      Filedescriptor variant of [gtk.accel_map.AccelMap.load].
      
      Note that the file descriptor will not be closed by this function.
  
      Params:
        fd = a valid readable file descriptor
  */
  static void loadFd(int fd)
  {
    gtk_accel_map_load_fd(fd);
  }

  /**
      #GScanner variant of [gtk.accel_map.AccelMap.load].
  
      Params:
        scanner = a #GScanner which has already been provided with an input file
  */
  static void loadScanner(glib.scanner.Scanner scanner)
  {
    gtk_accel_map_load_scanner(scanner ? cast(GScanner*)scanner._cPtr : null);
  }

  /**
      Locks the given accelerator path. If the accelerator map doesn’t yet contain
      an entry for accel_path, a new one is created.
      
      Locking an accelerator path prevents its accelerator from being changed
      during runtime. A locked accelerator path can be unlocked by
      [gtk.accel_map.AccelMap.unlockPath]. Refer to [gtk.accel_map.AccelMap.changeEntry]
      for information about runtime accelerator changes.
      
      If called more than once, accel_path remains locked until
      [gtk.accel_map.AccelMap.unlockPath] has been called an equivalent number
      of times.
      
      Note that locking of individual accelerator paths is independent from
      locking the #GtkAccelGroup containing them. For runtime accelerator
      changes to be possible, both the accelerator path and its #GtkAccelGroup
      have to be unlocked.
  
      Params:
        accelPath = a valid accelerator path
  */
  static void lockPath(string accelPath)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_accel_map_lock_path(_accelPath);
  }

  /**
      Looks up the accelerator entry for accel_path and fills in key.
  
      Params:
        accelPath = a valid accelerator path
        key = the accelerator key to be filled in (optional)
      Returns: true if accel_path is known, false otherwise
  */
  static bool lookupEntry(string accelPath, out gtk.types.AccelKey key)
  {
    bool _retval;
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    _retval = cast(bool)gtk_accel_map_lookup_entry(_accelPath, &key);
    return _retval;
  }

  /**
      Saves current accelerator specifications (accelerator path, key
      and modifiers) to file_name.
      The file is written in a format suitable to be read back in by
      [gtk.accel_map.AccelMap.load].
  
      Params:
        fileName = the name of the file to contain
            accelerator specifications, in the GLib file name encoding
  */
  static void save(string fileName)
  {
    const(char)* _fileName = fileName.toCString(No.Alloc);
    gtk_accel_map_save(_fileName);
  }

  /**
      Filedescriptor variant of [gtk.accel_map.AccelMap.save].
      
      Note that the file descriptor will not be closed by this function.
  
      Params:
        fd = a valid writable file descriptor
  */
  static void saveFd(int fd)
  {
    gtk_accel_map_save_fd(fd);
  }

  /**
      Undoes the last call to [gtk.accel_map.AccelMap.lockPath] on this accel_path.
      Refer to [gtk.accel_map.AccelMap.lockPath] for information about accelerator path locking.
  
      Params:
        accelPath = a valid accelerator path
  */
  static void unlockPath(string accelPath)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_accel_map_unlock_path(_accelPath);
  }

  /**
      Connect to `Changed` signal.
  
      Notifies of a change in the global accelerator map.
      The path is also used as the detail for the signal,
      so it is possible to connect to
      changed::`accel_path`.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string accelPath, uint accelKey, gdk.types.ModifierType accelMods, gtk.accel_map.AccelMap accelMap))
  
          `accelPath` the path of the accelerator that changed (optional)
  
          `accelKey` the key value for the new accelerator (optional)
  
          `accelMods` the modifier mask for the new accelerator (optional)
  
          `accelMap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.types.ModifierType)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.accel_map.AccelMap)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
