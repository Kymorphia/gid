/// Module for [DesktopAppInfo] class
module gio.desktop_app_info;

import gid.gid;
import gio.app_info;
import gio.app_info_mixin;
import gio.app_launch_context;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.key_file;
import glib.types;
import gobject.object;

/**
    [gio.desktop_app_info.DesktopAppInfo] is an implementation of [gio.app_info.AppInfo] based on
    desktop files.
    
    Note that `<gio/gdesktopappinfo.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
class DesktopAppInfo : gobject.object.ObjectWrap, gio.app_info.AppInfo
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
    return cast(void function())g_desktop_app_info_get_type != &gidSymbolNotFound ? g_desktop_app_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DesktopAppInfo self()
  {
    return this;
  }

  mixin AppInfoT!();

  /**
      Creates a new #GDesktopAppInfo based on a desktop file id.
      
      A desktop file id is the basename of the desktop file, including the
      .desktop extension. GIO is looking for a desktop file with this name
      in the `applications` subdirectories of the XDG
      data directories (i.e. the directories specified in the `XDG_DATA_HOME`
      and `XDG_DATA_DIRS` environment variables). GIO also supports the
      prefix-to-subdirectory mapping that is described in the
      [Menu Spec](http://standards.freedesktop.org/menu-spec/latest/)
      (i.e. a desktop id of kde-foo.desktop will match
      `/usr/share/applications/kde/foo.desktop`).
  
      Params:
        desktopId = the desktop file id
      Returns: a new #GDesktopAppInfo, or null if no desktop
            file with that id exists.
  */
  this(string desktopId)
  {
    GDesktopAppInfo* _cretval;
    const(char)* _desktopId = desktopId.toCString(No.Alloc);
    _cretval = g_desktop_app_info_new(_desktopId);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GDesktopAppInfo.
  
      Params:
        filename = the path of a desktop file, in the GLib
               filename encoding
      Returns: a new #GDesktopAppInfo or null on error.
  */
  static gio.desktop_app_info.DesktopAppInfo newFromFilename(string filename)
  {
    GDesktopAppInfo* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = g_desktop_app_info_new_from_filename(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.desktop_app_info.DesktopAppInfo)(cast(GDesktopAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GDesktopAppInfo.
  
      Params:
        keyFile = an opened #GKeyFile
      Returns: a new #GDesktopAppInfo or null on error.
  */
  static gio.desktop_app_info.DesktopAppInfo newFromKeyfile(glib.key_file.KeyFile keyFile)
  {
    GDesktopAppInfo* _cretval;
    _cretval = g_desktop_app_info_new_from_keyfile(keyFile ? cast(GKeyFile*)keyFile._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.desktop_app_info.DesktopAppInfo)(cast(GDesktopAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets all applications that implement interface.
      
      An application implements an interface if that interface is listed in
      the Implements= line of the desktop file of the application.
  
      Params:
        interface_ = the name of the interface
      Returns: a list of #GDesktopAppInfo
        objects.
  */
  static gio.desktop_app_info.DesktopAppInfo[] getImplementations(string interface_)
  {
    GList* _cretval;
    const(char)* _interface_ = interface_.toCString(No.Alloc);
    _cretval = g_desktop_app_info_get_implementations(_interface_);
    auto _retval = gListToD!(gio.desktop_app_info.DesktopAppInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sets the name of the desktop that the application is running in.
      This is used by [gio.app_info.AppInfo.shouldShow] and
      [gio.desktop_app_info.DesktopAppInfo.getShowIn] to evaluate the
      `OnlyShowIn` and `NotShowIn`
      desktop entry fields.
      
      Should be called only once; subsequent calls are ignored.
  
      Params:
        desktopEnv = a string specifying what desktop this is
  
      Deprecated: do not use this API.  Since 2.42 the value of the
        `XDG_CURRENT_DESKTOP` environment variable will be used.
  */
  static void setDesktopEnv(string desktopEnv)
  {
    const(char)* _desktopEnv = desktopEnv.toCString(No.Alloc);
    g_desktop_app_info_set_desktop_env(_desktopEnv);
  }

  /**
      Gets the user-visible display name of the "additional application
      action" specified by action_name.
      
      This corresponds to the "Name" key within the keyfile group for the
      action.
  
      Params:
        actionName = the name of the action as from
            [gio.desktop_app_info.DesktopAppInfo.listActions]
      Returns: the locale-specific action name
  */
  string getActionName(string actionName)
  {
    char* _cretval;
    const(char)* _actionName = actionName.toCString(No.Alloc);
    _cretval = g_desktop_app_info_get_action_name(cast(GDesktopAppInfo*)this._cPtr, _actionName);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Looks up a boolean value in the keyfile backing info.
      
      The key is looked up in the "Desktop Entry" group.
  
      Params:
        key = the key to look up
      Returns: the boolean value, or false if the key
            is not found
  */
  bool getBoolean(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_desktop_app_info_get_boolean(cast(GDesktopAppInfo*)this._cPtr, _key);
    return _retval;
  }

  /**
      Gets the categories from the desktop file.
      Returns: The unparsed Categories key from the desktop file;
            i.e. no attempt is made to split it by ';' or validate it.
  */
  string getCategories()
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_categories(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      When info was created from a known filename, return it.  In some
      situations such as the #GDesktopAppInfo returned from
      [gio.desktop_app_info.DesktopAppInfo.newFromKeyfile], this function will return null.
      Returns: The full path to the file for info,
            or null if not known.
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_filename(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the generic name from the desktop file.
      Returns: The value of the GenericName key
  */
  string getGenericName()
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_generic_name(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      A desktop file is hidden if the Hidden key in it is
      set to True.
      Returns: true if hidden, false otherwise.
  */
  bool getIsHidden()
  {
    bool _retval;
    _retval = cast(bool)g_desktop_app_info_get_is_hidden(cast(GDesktopAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the keywords from the desktop file.
      Returns: The value of the Keywords key
  */
  string[] getKeywords()
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
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Looks up a localized string value in the keyfile backing info
      translated to the current locale.
      
      The key is looked up in the "Desktop Entry" group.
  
      Params:
        key = the key to look up
      Returns: a newly allocated string, or null if the key
            is not found
  */
  string getLocaleString(string key)
  {
    char* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_desktop_app_info_get_locale_string(cast(GDesktopAppInfo*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the value of the NoDisplay key, which helps determine if the
      application info should be shown in menus. See
      [glib.types.KEY_FILE_DESKTOP_KEY_NO_DISPLAY] and [gio.app_info.AppInfo.shouldShow].
      Returns: The value of the NoDisplay key
  */
  bool getNodisplay()
  {
    bool _retval;
    _retval = cast(bool)g_desktop_app_info_get_nodisplay(cast(GDesktopAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the application info should be shown in menus that list available
      applications for a specific name of the desktop, based on the
      `OnlyShowIn` and `NotShowIn` keys.
      
      desktop_env should typically be given as null, in which case the
      `XDG_CURRENT_DESKTOP` environment variable is consulted.  If you want
      to override the default mechanism then you may specify desktop_env,
      but this is not recommended.
      
      Note that [gio.app_info.AppInfo.shouldShow] for info will include this check (with
      null for desktop_env) as well as additional checks.
  
      Params:
        desktopEnv = a string specifying a desktop name
      Returns: true if the info should be shown in desktop_env according to the
        `OnlyShowIn` and `NotShowIn` keys, false
        otherwise.
  */
  bool getShowIn(string desktopEnv = null)
  {
    bool _retval;
    const(char)* _desktopEnv = desktopEnv.toCString(No.Alloc);
    _retval = cast(bool)g_desktop_app_info_get_show_in(cast(GDesktopAppInfo*)this._cPtr, _desktopEnv);
    return _retval;
  }

  /**
      Retrieves the StartupWMClass field from info. This represents the
      WM_CLASS property of the main window of the application, if launched
      through info.
      Returns: the startup WM class, or null if none is set
        in the desktop file.
  */
  string getStartupWmClass()
  {
    const(char)* _cretval;
    _cretval = g_desktop_app_info_get_startup_wm_class(cast(GDesktopAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Looks up a string value in the keyfile backing info.
      
      The key is looked up in the "Desktop Entry" group.
  
      Params:
        key = the key to look up
      Returns: a newly allocated string, or null if the key
            is not found
  */
  string getString(string key)
  {
    char* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_desktop_app_info_get_string(cast(GDesktopAppInfo*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Looks up a string list value in the keyfile backing info.
      
      The key is looked up in the "Desktop Entry" group.
  
      Params:
        key = the key to look up
      Returns: a null-terminated string array or null if the specified
         key cannot be found. The array should be freed with [glib.global.strfreev].
  */
  string[] getStringList(string key)
  {
    char** _cretval;
    size_t _cretlength;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_desktop_app_info_get_string_list(cast(GDesktopAppInfo*)this._cPtr, _key, &_cretlength);
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
      Returns whether key exists in the "Desktop Entry" group
      of the keyfile backing info.
  
      Params:
        key = the key to look up
      Returns: true if the key exists
  */
  bool hasKey(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = cast(bool)g_desktop_app_info_has_key(cast(GDesktopAppInfo*)this._cPtr, _key);
    return _retval;
  }

  /**
      Activates the named application action.
      
      You may only call this function on action names that were
      returned from [gio.desktop_app_info.DesktopAppInfo.listActions].
      
      Note that if the main entry of the desktop file indicates that the
      application supports startup notification, and launch_context is
      non-null, then startup notification will be used when activating the
      action (and as such, invocation of the action on the receiving side
      must signal the end of startup notification when it is completed).
      This is the expected behaviour of applications declaring additional
      actions, as per the desktop file specification.
      
      As with [gio.app_info.AppInfo.launch] there is no way to detect failures that
      occur while using this function.
  
      Params:
        actionName = the name of the action as from
            [gio.desktop_app_info.DesktopAppInfo.listActions]
        launchContext = a #GAppLaunchContext
  */
  void launchAction(string actionName, gio.app_launch_context.AppLaunchContext launchContext = null)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    g_desktop_app_info_launch_action(cast(GDesktopAppInfo*)this._cPtr, _actionName, launchContext ? cast(GAppLaunchContext*)launchContext._cPtr(No.Dup) : null);
  }

  /**
      This function performs the equivalent of [gio.app_info.AppInfo.launchUris],
      but is intended primarily for operating system components that
      launch applications.  Ordinary applications should use
      [gio.app_info.AppInfo.launchUris].
      
      If the application is launched via GSpawn, then spawn_flags, user_setup
      and user_setup_data are used for the call to [glib.global.spawnAsync].
      Additionally, pid_callback (with pid_callback_data) will be called to
      inform about the PID of the created process. See [glib.global.spawnAsyncWithPipes]
      for information on certain parameter conditions that can enable an
      optimized posix_spawn() codepath to be used.
      
      If application launching occurs via some other mechanism (eg: D-Bus
      activation) then spawn_flags, user_setup, user_setup_data,
      pid_callback and pid_callback_data are ignored.
  
      Params:
        uris = List of URIs
        launchContext = a #GAppLaunchContext
        spawnFlags = #GSpawnFlags, used for each process
        userSetup = a #GSpawnChildSetupFunc, used once
              for each process.
        pidCallback = Callback for child processes
      Returns: true on successful launch, false otherwise.
      Throws: [ErrorWrap]
  */
  bool launchUrisAsManager(string[] uris, gio.app_launch_context.AppLaunchContext launchContext, glib.types.SpawnFlags spawnFlags, glib.types.SpawnChildSetupFunc userSetup = null, gio.types.DesktopAppLaunchCallback pidCallback = null)
  {
    extern(C) void _userSetupCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

      (*_dlg)();
    }
    auto _userSetupCB = userSetup ? &_userSetupCallback : null;
    extern(C) void _pidCallbackCallback(GDesktopAppInfo* appinfo, GPid pid, void* userData)
    {
      auto _dlg = cast(gio.types.DesktopAppLaunchCallback*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.desktop_app_info.DesktopAppInfo)(cast(void*)appinfo, No.Take), pid);
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
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Equivalent to [gio.desktop_app_info.DesktopAppInfo.launchUrisAsManager] but allows
      you to pass in file descriptors for the stdin, stdout and stderr streams
      of the launched process.
      
      If application launching occurs via some non-spawn mechanism (e.g. D-Bus
      activation) then stdin_fd, stdout_fd and stderr_fd are ignored.
  
      Params:
        uris = List of URIs
        launchContext = a #GAppLaunchContext
        spawnFlags = #GSpawnFlags, used for each process
        userSetup = a #GSpawnChildSetupFunc, used once
              for each process.
        pidCallback = Callback for child processes
        stdinFd = file descriptor to use for child's stdin, or -1
        stdoutFd = file descriptor to use for child's stdout, or -1
        stderrFd = file descriptor to use for child's stderr, or -1
      Returns: true on successful launch, false otherwise.
      Throws: [ErrorWrap]
  */
  bool launchUrisAsManagerWithFds(string[] uris, gio.app_launch_context.AppLaunchContext launchContext, glib.types.SpawnFlags spawnFlags, glib.types.SpawnChildSetupFunc userSetup, gio.types.DesktopAppLaunchCallback pidCallback, int stdinFd, int stdoutFd, int stderrFd)
  {
    extern(C) void _userSetupCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

      (*_dlg)();
    }
    auto _userSetupCB = userSetup ? &_userSetupCallback : null;
    extern(C) void _pidCallbackCallback(GDesktopAppInfo* appinfo, GPid pid, void* userData)
    {
      auto _dlg = cast(gio.types.DesktopAppLaunchCallback*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.desktop_app_info.DesktopAppInfo)(cast(void*)appinfo, No.Take), pid);
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
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Returns the list of "additional application actions" supported on the
      desktop file, as per the desktop file specification.
      
      As per the specification, this is the list of actions that are
      explicitly listed in the "Actions" key of the [Desktop Entry] group.
      Returns: a list of strings, always non-null
  */
  string[] listActions()
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
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }
}
