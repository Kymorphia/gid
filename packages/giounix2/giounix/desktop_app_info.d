/// Module for [DesktopAppInfo] class
module giounix.desktop_app_info;

public import gid.basictypes;
import gid.gid;
import gio.app_info;
import gio.app_info_mixin;
import gio.app_launch_context;
import giounix.c.functions;
import giounix.c.types;
import giounix.types;
import glib.error;
import glib.key_file;
import glib.types;
import gobject.gid_builder;
import gobject.object;

/**
    [giounix.desktop_app_info.DesktopAppInfo] is an implementation of [gio.app_info.AppInfo] based on
    desktop files.
    
    Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class DesktopAppInfo : gobject.object.ObjectWrap, gio.app_info.AppInfo
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_desktop_app_info_get_type != &gidSymbolNotFound ? g_desktop_app_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DesktopAppInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [giounix.desktop_app_info.DesktopAppInfo]
      Returns: New builder object
  */
  static DesktopAppInfoGidBuilder builder() nothrow
  {
    return new DesktopAppInfoGidBuilder;
  }

  /**
      Get `filename` property.
      Returns: The origin filename of this [giounix.desktop_app_info.DesktopAppInfo]
  */
  @property string filename() nothrow
  {
    return getFilename();
  }

  mixin AppInfoT!();

  /**
      Creates a new [giounix.desktop_app_info.DesktopAppInfo] based on a desktop file ID.
      
      A desktop file ID is the basename of the desktop file, including the
      `.desktop` extension. GIO is looking for a desktop file with this name
      in the `applications` subdirectories of the XDG
      data directories (i.e. the directories specified in the `XDG_DATA_HOME`
      and `XDG_DATA_DIRS` environment variables). GIO also supports the
      prefix-to-subdirectory mapping that is described in the
      [Menu Spec](http://standards.freedesktop.org/menu-spec/latest/)
      (i.e. a desktop ID of `kde-foo.desktop` will match
      `/usr/share/applications/kde/foo.desktop`).
  
      Params:
        desktopId = the desktop file ID
      Returns: a new [giounix.desktop_app_info.DesktopAppInfo], or `NULL` if no
           desktop file with that ID exists.
  */
  this(string desktopId) nothrow
  {
    GDesktopAppInfo* _cretval;
    const(char)* _desktopId = desktopId.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_new(_desktopId);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [giounix.desktop_app_info.DesktopAppInfo].
  
      Params:
        filename = the path of a desktop file, in the GLib
               filename encoding
      Returns: a new [giounix.desktop_app_info.DesktopAppInfo] or `NULL` on error.
  */
  static giounix.desktop_app_info.DesktopAppInfo newFromFilename(string filename) nothrow
  {
    GDesktopAppInfo* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_new_from_filename(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(giounix.desktop_app_info.DesktopAppInfo)(cast(GDesktopAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [giounix.desktop_app_info.DesktopAppInfo].
  
      Params:
        keyFile = an opened [glib.key_file.KeyFile]
      Returns: a new [giounix.desktop_app_info.DesktopAppInfo] or `NULL` on error.
  */
  static giounix.desktop_app_info.DesktopAppInfo newFromKeyfile(glib.key_file.KeyFile keyFile) nothrow
  {
    GDesktopAppInfo* _cretval;
    _cretval = g_desktop_app_info_new_from_keyfile(keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(giounix.desktop_app_info.DesktopAppInfo)(cast(GDesktopAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets all applications that implement interface.
      
      An application implements an interface if that interface is listed in
      the `Implements` line of the desktop file of the application.
  
      Params:
        interface_ = the name of the interface
      Returns: a list of
          [giounix.desktop_app_info.DesktopAppInfo] objects.
  */
  static giounix.desktop_app_info.DesktopAppInfo[] getImplementations(string interface_) nothrow
  {
    GList* _cretval;
    const(char)* _interface_ = interface_.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_get_implementations(_interface_);
    auto _retval = gListToD!(giounix.desktop_app_info.DesktopAppInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets the name of the desktop that the application is running in.
      
      This is used by [gio.app_info.AppInfo.shouldShow] and
      [giounix.desktop_app_info.DesktopAppInfo.getShowIn] to evaluate the
      [`OnlyShowIn`](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-onlyshowin)
      and [`NotShowIn`](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-notshowin)
      keys.
      
      Should be called only once; subsequent calls are ignored.
  
      Params:
        desktopEnv = a string specifying what desktop this is
  
      Deprecated: do not use this API.  Since 2.42 the value of the
          `XDG_CURRENT_DESKTOP` environment variable will be used.
  */
  static void setDesktopEnv(string desktopEnv) nothrow
  {
    const(char)* _desktopEnv = desktopEnv.toCString!(No.Malloc, No.Nullable);
    g_desktop_app_info_set_desktop_env(_desktopEnv);
  }

  /**
      Gets the user-visible display name of the
      [‘additional application actions’](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s11.html)
      specified by action_name.
      
      This corresponds to the `Name` key within the keyfile group for the
      action.
  
      Params:
        actionName = the name of the action as from
            [giounix.desktop_app_info.DesktopAppInfo.listActions]
      Returns: the locale-specific action name
  */
  string getActionName(string actionName) nothrow
  {
    char* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_get_action_name(cast(GDesktopAppInfo*)this._cPtr, _actionName);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Looks up a boolean value in the keyfile backing info.
      
      The key is looked up in the `Desktop Entry` group.
  
      Params:
        key = the key to look up
      Returns: the boolean value, or `FALSE` if the key is not found
  */
  bool getBoolean(string key) nothrow
  {
    bool _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_desktop_app_info_get_boolean(cast(GDesktopAppInfo*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the categories from the desktop file.
      Returns: The unparsed
          [`Categories` key](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-categories)
          from the desktop file;
          i.e. no attempt is made to split it by `;` or validate it.
  */
  string getCategories() nothrow
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_categories(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      When info was created from a known filename, return it.
      
      In some situations such as a [giounix.desktop_app_info.DesktopAppInfo] returned
      from [giounix.desktop_app_info.DesktopAppInfo.newFromKeyfile], this function
      will return `NULL`.
      Returns: The full path to the file for info,
          or `NULL` if not known.
  */
  string getFilename() nothrow
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_filename(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the generic name from the desktop file.
      Returns: The value of the
          [`GenericName` key](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-genericname)
  */
  string getGenericName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_generic_name(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      A desktop file is hidden if the
      [`Hidden` key](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-hidden)
      in it is set to `True`.
      Returns: `TRUE` if hidden, `FALSE` otherwise.
  */
  bool getIsHidden() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_desktop_app_info_get_is_hidden(cast(GDesktopAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the keywords from the desktop file.
      Returns: The value of the
          [`Keywords` key](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-keywords)
  */
  string[] getKeywords() nothrow
  {
    const(char*)* _cretval;
    _cretval = g_desktop_app_info_get_keywords(cast(GDesktopAppInfo*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Looks up a localized string value in the keyfile backing info
      translated to the current locale.
      
      The key is looked up in the `Desktop Entry` group.
  
      Params:
        key = the key to look up
      Returns: a newly allocated string, or `NULL` if the key is not
          found
  */
  string getLocaleString(string key) nothrow
  {
    char* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_get_locale_string(cast(GDesktopAppInfo*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the value of the
      [`NoDisplay` key](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-nodisplay)
       which helps determine if the application info should be shown in menus. See
      [glib.types.KEY_FILE_DESKTOP_KEY_NO_DISPLAY] and [gio.app_info.AppInfo.shouldShow].
      Returns: The value of the `NoDisplay` key
  */
  bool getNodisplay() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_desktop_app_info_get_nodisplay(cast(GDesktopAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the application info should be shown in menus that list available
      applications for a specific name of the desktop, based on the
      [`OnlyShowIn`](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-onlyshowin)
      and [`NotShowIn`](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-notshowin)
      keys.
      
      desktop_env should typically be given as `NULL`, in which case the
      `XDG_CURRENT_DESKTOP` environment variable is consulted.  If you want
      to override the default mechanism then you may specify desktop_env,
      but this is not recommended.
      
      Note that [gio.app_info.AppInfo.shouldShow] for info will include this check
      (with `NULL` for desktop_env) as well as additional checks.
  
      Params:
        desktopEnv = a string specifying a desktop name
      Returns: `TRUE` if the info should be shown in desktop_env according to the
        `OnlyShowIn` and `NotShowIn` keys, `FALSE` otherwise.
  */
  bool getShowIn(string desktopEnv = null) nothrow
  {
    bool _retval;
    const(char)* _desktopEnv = desktopEnv.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)g_desktop_app_info_get_show_in(cast(GDesktopAppInfo*)this._cPtr, _desktopEnv);
    return _retval;
  }

  /**
      Retrieves the `StartupWMClass` field from info. This represents the
      `WM_CLASS` property of the main window of the application, if launched
      through info.
      Returns: the startup WM class, or `NULL` if none
          is set in the desktop file.
  */
  string getStartupWmClass() nothrow
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_startup_wm_class(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Looks up a string value in the keyfile backing info.
      
      The key is looked up in the `Desktop Entry` group.
  
      Params:
        key = the key to look up
      Returns: a newly allocated string, or `NULL` if the key is not
          found
  */
  string getString(string key) nothrow
  {
    char* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_get_string(cast(GDesktopAppInfo*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Looks up a string list value in the keyfile backing info.
      
      The key is looked up in the `Desktop Entry` group.
  
      Params:
        key = the key to look up
      Returns: a `NULL`-terminated string array or `NULL` if the specified
          key cannot be found. The array should be freed with `funcGLib.strfreev`.
  */
  string[] getStringList(string key) nothrow
  {
    char** _cretval;
    size_t _cretlength;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_get_string_list(cast(GDesktopAppInfo*)this._cPtr, _key, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Returns whether key exists in the `Desktop Entry` group
      of the keyfile backing info.
  
      Params:
        key = the key to look up
      Returns: `TRUE` if the key exists
  */
  bool hasKey(string key) nothrow
  {
    bool _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_desktop_app_info_has_key(cast(GDesktopAppInfo*)this._cPtr, _key);
    return _retval;
  }

  /**
      Activates the named application action.
      
      You may only call this function on action names that were
      returned from [giounix.desktop_app_info.DesktopAppInfo.listActions].
      
      Note that if the main entry of the desktop file indicates that the
      application supports startup notification, and launch_context is
      non-`NULL`, then startup notification will be used when activating the
      action (and as such, invocation of the action on the receiving side
      must signal the end of startup notification when it is completed).
      This is the expected behaviour of applications declaring additional
      actions, as per the
      [desktop file specification](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s11.html).
      
      As with [gio.app_info.AppInfo.launch] there is no way to detect failures that
      occur while using this function.
  
      Params:
        actionName = the name of the action as from
            [giounix.desktop_app_info.DesktopAppInfo.listActions]
        launchContext = a [gio.app_launch_context.AppLaunchContext]
  */
  void launchAction(string actionName, gio.app_launch_context.AppLaunchContext launchContext = null) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_desktop_app_info_launch_action(cast(GDesktopAppInfo*)this._cPtr, _actionName, launchContext ? cast(GAppLaunchContext*)launchContext._cPtr(No.Dup) : null);
  }

  /**
      This function performs the equivalent of [gio.app_info.AppInfo.launchUris],
      but is intended primarily for operating system components that
      launch applications.  Ordinary applications should use
      [gio.app_info.AppInfo.launchUris].
      
      If the application is launched via GSpawn, then spawn_flags, user_setup
      and user_setup_data are used for the call to `funcGLib.spawn_async`.
      Additionally, pid_callback (with pid_callback_data) will be called to
      inform about the PID of the created process. See
      `funcGLib.spawn_async_with_pipes` for information on certain parameter
      conditions that can enable an optimized [`posix_spawn()`](man:posix_spawn(3))
      code path to be used.
      
      If application launching occurs via some other mechanism (for example, D-Bus
      activation) then spawn_flags, user_setup, user_setup_data,
      pid_callback and pid_callback_data are ignored.
  
      Params:
        uris = List of URIs
        launchContext = a [gio.app_launch_context.AppLaunchContext]
        spawnFlags = [glib.types.SpawnFlags], used for each process
        userSetup = a [glib.types.SpawnChildSetupFunc],
            used once  for each process.
        pidCallback = Callback for child processes
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  */
  bool launchUrisAsManager(string[] uris, gio.app_launch_context.AppLaunchContext launchContext, glib.types.SpawnFlags spawnFlags, glib.types.SpawnChildSetupFunc userSetup = null, giounix.types.DesktopAppLaunchCallback pidCallback = null)
  {
    extern(C) void _userSetupCallback(void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.SpawnChildSetupFunc");
      }
    }
    auto _userSetupCB = userSetup ? &_userSetupCallback : null;
    extern(C) void _pidCallbackCallback(GDesktopAppInfo* appinfo, GPid pid, void* userData) nothrow
    {
      auto _dlg = cast(giounix.types.DesktopAppLaunchCallback*)userData;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(giounix.desktop_app_info.DesktopAppInfo)(cast(void*)appinfo, No.Take), pid);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "giounix.types.DesktopAppLaunchCallback");
      }
    }
    auto _pidCallbackCB = pidCallback ? &_pidCallbackCallback : null;
    bool _retval;
    auto _uris = gListFromD!(string)(uris);
    scope(exit) containerFree!(GList*, string, GidOwnership.None)(_uris);
    auto _userSetup = userSetup ? freezeDelegate(cast(void*)&userSetup) : null;
    auto _pidCallback = pidCallback ? cast(void*)&(pidCallback) : null;
    GError *_err;
    _retval = cast(bool)g_desktop_app_info_launch_uris_as_manager(cast(GDesktopAppInfo*)this._cPtr, _uris, launchContext ? cast(GAppLaunchContext*)launchContext._cPtr(No.Dup) : null, spawnFlags, _userSetupCB, _userSetup, _pidCallbackCB, _pidCallback, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Equivalent to [giounix.desktop_app_info.DesktopAppInfo.launchUrisAsManager] but
      allows you to pass in file descriptors for the stdin, stdout and stderr
      streams of the launched process.
      
      If application launching occurs via some non-spawn mechanism (e.g. D-Bus
      activation) then stdin_fd, stdout_fd and stderr_fd are ignored.
  
      Params:
        uris = List of URIs
        launchContext = a [gio.app_launch_context.AppLaunchContext]
        spawnFlags = [glib.types.SpawnFlags], used for each process
        userSetup = a
            [glib.types.SpawnChildSetupFunc], used once for each process.
        pidCallback = Callback for child processes
        stdinFd = file descriptor to use for child’s stdin, or `-1`
        stdoutFd = file descriptor to use for child’s stdout, or `-1`
        stderrFd = file descriptor to use for child’s stderr, or `-1`
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  */
  bool launchUrisAsManagerWithFds(string[] uris, gio.app_launch_context.AppLaunchContext launchContext, glib.types.SpawnFlags spawnFlags, glib.types.SpawnChildSetupFunc userSetup, giounix.types.DesktopAppLaunchCallback pidCallback, int stdinFd, int stdoutFd, int stderrFd)
  {
    extern(C) void _userSetupCallback(void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.SpawnChildSetupFunc");
      }
    }
    auto _userSetupCB = userSetup ? &_userSetupCallback : null;
    extern(C) void _pidCallbackCallback(GDesktopAppInfo* appinfo, GPid pid, void* userData) nothrow
    {
      auto _dlg = cast(giounix.types.DesktopAppLaunchCallback*)userData;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(giounix.desktop_app_info.DesktopAppInfo)(cast(void*)appinfo, No.Take), pid);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "giounix.types.DesktopAppLaunchCallback");
      }
    }
    auto _pidCallbackCB = pidCallback ? &_pidCallbackCallback : null;
    bool _retval;
    auto _uris = gListFromD!(string)(uris);
    scope(exit) containerFree!(GList*, string, GidOwnership.None)(_uris);
    auto _userSetup = userSetup ? freezeDelegate(cast(void*)&userSetup) : null;
    auto _pidCallback = pidCallback ? cast(void*)&(pidCallback) : null;
    GError *_err;
    _retval = cast(bool)g_desktop_app_info_launch_uris_as_manager_with_fds(cast(GDesktopAppInfo*)this._cPtr, _uris, launchContext ? cast(GAppLaunchContext*)launchContext._cPtr(No.Dup) : null, spawnFlags, _userSetupCB, _userSetup, _pidCallbackCB, _pidCallback, stdinFd, stdoutFd, stderrFd, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Returns the list of
      [‘additional application actions’](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s11.html)
      supported on the desktop file, as per the desktop file specification.
      
      As per the specification, this is the list of actions that are
      explicitly listed in the `Actions` key of the `Desktop Entry` group.
      Returns: a
          list of strings, always non-`NULL`
  */
  string[] listActions() nothrow
  {
    const(char*)* _cretval;
    _cretval = g_desktop_app_info_list_actions(cast(GDesktopAppInfo*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [giounix.desktop_app_info.DesktopAppInfo]
class DesktopAppInfoGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.app_info.AppInfoGidBuilderImpl!T
{

  mixin AppInfoGidBuilderT!();

  /**
      Set `filename` property.
      Params:
        propval = The origin filename of this [giounix.desktop_app_info.DesktopAppInfo]
      Returns: Builder instance for fluent chaining
  */
  T filename(string propval) nothrow
  {
    return setProperty("filename", propval);
  }
}

/// Fluent builder for [giounix.desktop_app_info.DesktopAppInfo]
final class DesktopAppInfoGidBuilder : DesktopAppInfoGidBuilderImpl!DesktopAppInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DesktopAppInfo build() nothrow
  {
    return new DesktopAppInfo(cast(void*)createGObject(DesktopAppInfo._getGType), Yes.Take);
  }
}
