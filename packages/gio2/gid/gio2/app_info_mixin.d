/// Module for [AppInfo] interface mixin
module gid.gio2.app_info_mixin;

public import gid.core.basictypes;
public import gid.gio2.app_info;
public import gid.gio2.app_info_iface_proxy;
public import gid.core.utils;
public import gid.gio2.app_launch_context;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.file;
public import gid.gio2.icon;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    Information about an installed application and methods to launch
    it (with file arguments).
    
    [gid.gio2.app_info.AppInfo] and [gid.gio2.app_launch_context.AppLaunchContext] are used for describing and launching
    applications installed on the system.
    
    As of GLib 2.20, URIs will always be converted to POSIX paths
    (using [gid.gio2.file.File.getPath]) when using [gid.gio2.app_info.AppInfo.launch]
    even if the application requested an URI and not a POSIX path. For example
    for a desktop-file based application with the following Exec key:
    
    ```
    Exec=totem %U
    ```
    
    and a single URI, `sftp://foo/file.avi`, then
    `/home/user/.gvfs/sftp on foo/file.avi` will be passed. This will only work
    if a set of suitable GIO extensions (such as GVfs 2.26 compiled with FUSE
    support), is available and operational; if this is not the case, the URI
    will be passed unmodified to the application. Some URIs, such as `mailto:`,
    of course cannot be mapped to a POSIX path (in GVfs there’s no FUSE mount
    for it); such URIs will be passed unmodified to the application.
    
    Specifically for GVfs 2.26 and later, the POSIX URI will be mapped
    back to the GIO URI in the [gid.gio2.file.File] constructors (since GVfs
    implements the GVfs extension point). As such, if the application
    needs to examine the URI, it needs to use [gid.gio2.file.File.getUri]
    or similar on [gid.gio2.file.File]. In other words, an application cannot
    assume that the URI passed to e.g. [gid.gio2.file.File.newForCommandlineArg]
    is equal to the result of [gid.gio2.file.File.getUri]. The following snippet
    illustrates this:
    
    ```c
    GFile *f;
    char *uri;
    
    file = g_file_new_for_commandline_arg (uri_from_commandline);
    
    uri = g_file_get_uri (file);
    strcmp (uri, uri_from_commandline) == 0;
    g_free (uri);
    
    if (g_file_has_uri_scheme (file, "cdda"))
      {
        // do something special with uri
      }
    g_object_unref (file);
    ```
    
    This code will work when both `cdda://sr0/Track 1.wav` and
    `/home/user/.gvfs/cdda on sr0/Track 1.wav` is passed to the
    application. It should be noted that it’s generally not safe
    for applications to rely on the format of a particular URIs.
    Different launcher applications (e.g. file managers) may have
    different ideas of what a given URI means.
*/
template AppInfoT()
{
















  /**
      Adds a content type to the application information to indicate the
      application is capable of opening files with the given content type.
  
      Params:
        contentType = a string.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddSupportsType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncAddSupportsType(string contentType)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.addSupportsType)
      return typeof(return).init;

    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.addSupportsType(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Obtains the information whether the [gid.gio2.app_info.AppInfo] can be deleted.
      See [gid.gio2.app_info.AppInfo.delete_].
      Returns: `TRUE` if appinfo can be deleted
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanDelete`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanDelete()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.canDelete)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canDelete(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a supported content type can be removed from an application.
      Returns: `TRUE` if it is possible to remove supported content types from a
          given appinfo, `FALSE` if not.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanRemoveSupportsType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanRemoveSupportsType()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.canRemoveSupportsType)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canRemoveSupportsType(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Tries to delete a [gid.gio2.app_info.AppInfo].
      
      On some platforms, there may be a difference between user-defined
      [gid.gio2.app_info.AppInfo]s which can be deleted, and system-wide ones which cannot.
      See [gid.gio2.app_info.AppInfo.canDelete].
      Returns: `TRUE` if appinfo has been deleted
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDoDelete`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncDoDelete()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.doDelete)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.doDelete(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Creates a duplicate of a [gid.gio2.app_info.AppInfo].
      Returns: a duplicate of appinfo.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDup`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.app_info.AppInfo vfuncDup()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.dup)
      return typeof(return).init;

    GAppInfo* _cretval;
    _cretval = _klass.dup(cast(GAppInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if two [gid.gio2.app_info.AppInfo]s are equal.
      
      Note that the check *may not* compare each individual field, and only does
      an identity check. In case detecting changes in the contents is needed,
      program code must additionally compare relevant fields.
  
      Params:
        appinfo2 = the second [gid.gio2.app_info.AppInfo].
      Returns: `TRUE` if appinfo1 is equal to appinfo2. `FALSE` otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEqual`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEqual(gid.gio2.app_info.AppInfo appinfo2)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.equal)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.equal(cast(GAppInfo*)this._cPtr, appinfo2 ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)appinfo2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the commandline with which the application will be
      started.
      Returns: a string containing the appinfo’s
          commandline, or `NULL` if this information is not available
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCommandline`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetCommandline()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getCommandline)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getCommandline(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a human-readable description of an installed application.
      Returns: a string containing a description of the
        application appinfo, or `NULL` if none.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDescription`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetDescription()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getDescription)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getDescription(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the display name of the application. The display name is often more
      descriptive to the user than the name itself.
      Returns: the display name of the application for appinfo, or the name if
        no display name is available.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDisplayName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetDisplayName()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getDisplayName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getDisplayName(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the executable’s name for the installed application.
      
      This is intended to be used for debugging or labelling what program is going
      to be run. To launch the executable, use [gid.gio2.app_info.AppInfo.launch] and related
      functions, rather than spawning the return value from this function.
      Returns: a string containing the appinfo’s application
        binaries name
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetExecutable`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetExecutable()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getExecutable)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getExecutable(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the icon for the application.
      Returns: the default [gid.gio2.icon.Icon] for
          appinfo or `NULL` if there is no default icon.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIcon`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.icon.Icon vfuncGetIcon()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getIcon)
      return typeof(return).init;

    GIcon* _cretval;
    _cretval = _klass.getIcon(cast(GAppInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the ID of an application. An id is a string that identifies the
      application. The exact format of the id is platform dependent. For instance,
      on Unix this is the desktop file id from the xdg menu specification.
      
      Note that the returned ID may be `NULL`, depending on how the appinfo has
      been constructed.
      Returns: a string containing the application’s ID.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetId`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetId()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getId)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getId(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the installed name of the application.
      Returns: the name of the application for appinfo.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetName()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getName(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the list of content types that app_info claims to support.
      If this information is not provided by the environment, this function
      will return `NULL`.
      
      This function does not take in consideration associations added with
      [gid.gio2.app_info.AppInfo.addSupportsType], but only those exported directly by
      the application.
      Returns: a list of content types.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSupportedTypes`
      to chain up from an override.
      Overriding it from D is not supported (callback return container type 'Array' ownership 'None' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncGetSupportedTypes()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.getSupportedTypes)
      return typeof(return).init;

    const(char*)* _cretval;
    _cretval = _klass.getSupportedTypes(cast(GAppInfo*)this._cPtr);
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
      Launches the application. Passes files to the launched application
      as arguments, using the optional context to get information
      about the details of the launcher (like what screen it is on).
      On error, error will be set accordingly.
      
      To launch the application without arguments pass a `NULL` files list.
      
      Note that even if the launch is successful the application launched
      can fail to start if it runs into problems during startup. There is
      no way to detect this.
      
      Some URIs can be changed when passed through a GFile (for instance
      unsupported URIs with strange formats like mailto:), so if you have
      a textual URI you want to pass in as argument, consider using
      [gid.gio2.app_info.AppInfo.launchUris] instead.
      
      The launched application inherits the environment of the launching
      process, but it can be modified with [gid.gio2.app_launch_context.AppLaunchContext.setenv]
      and [gid.gio2.app_launch_context.AppLaunchContext.unsetenv].
      
      On UNIX, this function sets the `GIO_LAUNCHED_DESKTOP_FILE`
      environment variable with the path of the launched desktop file and
      `GIO_LAUNCHED_DESKTOP_FILE_PID` to the process id of the launched
      process. This can be used to ignore `GIO_LAUNCHED_DESKTOP_FILE`,
      should it be inherited by further processes. The `DISPLAY`,
      `XDG_ACTIVATION_TOKEN` and `DESKTOP_STARTUP_ID` environment
      variables are also set, based on information provided in context.
  
      Params:
        files = a list of [gid.gio2.file.File] objects
        context = the launch context
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLaunch`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncLaunch(gid.gio2.file.File[] files = null, gid.gio2.app_launch_context.AppLaunchContext context = null)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.launch)
      return typeof(return).init;

    bool _retval;
    auto _files = gListFromD!(gid.gio2.file.File)(files);
    scope(exit) containerFree!(GList*, gid.gio2.file.File, GidOwnership.None)(_files);
    GError *_err;
    _retval = cast(bool)_klass.launch(cast(GAppInfo*)this._cPtr, _files, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Launches the application. This passes the uris to the launched application
      as arguments, using the optional context to get information
      about the details of the launcher (like what screen it is on).
      On error, error will be set accordingly. If the application only supports
      one URI per invocation as part of their command-line, multiple instances
      of the application will be spawned.
      
      To launch the application without arguments pass a `NULL` uris list.
      
      Note that even if the launch is successful the application launched
      can fail to start if it runs into problems during startup. There is
      no way to detect this.
  
      Params:
        uris = a list of URIs to launch.
        context = the launch context
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLaunchUris`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncLaunchUris(string[] uris = null, gid.gio2.app_launch_context.AppLaunchContext context = null)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.launchUris)
      return typeof(return).init;

    bool _retval;
    auto _uris = gListFromD!(string)(uris);
    scope(exit) containerFree!(GList*, string, GidOwnership.None)(_uris);
    GError *_err;
    _retval = cast(bool)_klass.launchUris(cast(GAppInfo*)this._cPtr, _uris, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Async version of [gid.gio2.app_info.AppInfo.launchUris].
      
      The callback is invoked immediately after the application launch, but it
      waits for activation in case of D-Bus–activated applications and also provides
      extended error information for sandboxed applications, see notes for
      [gid.gio2.app_info.AppInfo.launchDefaultForUriAsync].
  
      Params:
        uris = a list of URIs to launch.
        context = the launch context
        cancellable = a [gid.gio2.cancellable.Cancellable]
        callback = a [gid.gio2.types.AsyncReadyCallback] to call
            when the request is done
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLaunchUrisAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncLaunchUrisAsync(string[] uris = null, gid.gio2.app_launch_context.AppLaunchContext context = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.launchUrisAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _uris = gListFromD!(string)(uris);
    scope(exit) containerFree!(GList*, string, GidOwnership.None)(_uris);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.launchUrisAsync(cast(GAppInfo*)this._cPtr, _uris, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a [gid.gio2.app_info.AppInfo.launchUrisAsync] operation.
  
      Params:
        result = the async result
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLaunchUrisFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncLaunchUrisFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.launchUrisFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.launchUrisFinish(cast(GAppInfo*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Removes a supported type from an application, if possible.
  
      Params:
        contentType = a string.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveSupportsType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncRemoveSupportsType(string contentType)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.removeSupportsType)
      return typeof(return).init;

    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.removeSupportsType(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the application as the default handler for the given file extension.
  
      Params:
        extension = a string containing the file extension (without
            the dot).
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetAsDefaultForExtension`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetAsDefaultForExtension(string extension)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.setAsDefaultForExtension)
      return typeof(return).init;

    bool _retval;
    const(char)* _extension = extension.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.setAsDefaultForExtension(cast(GAppInfo*)this._cPtr, _extension, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the application as the default handler for a given type.
  
      Params:
        contentType = the content type.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetAsDefaultForType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetAsDefaultForType(string contentType)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.setAsDefaultForType)
      return typeof(return).init;

    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.setAsDefaultForType(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the application as the last used application for a given type. This
      will make the application appear as first in the list returned by
      [gid.gio2.app_info.AppInfo.getRecommendedForType], regardless of the default
      application for that content type.
  
      Params:
        contentType = the content type.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetAsLastUsedForType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetAsLastUsedForType(string contentType)
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.setAsLastUsedForType)
      return typeof(return).init;

    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.setAsLastUsedForType(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks if the application info should be shown in menus that
      list available applications.
      Returns: `TRUE` if the appinfo should be shown, `FALSE` otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncShouldShow`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncShouldShow()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.shouldShow)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.shouldShow(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the application accepts files as arguments.
      Returns: `TRUE` if the appinfo supports files.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSupportsFiles`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSupportsFiles()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.supportsFiles)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.supportsFiles(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the application supports reading files and directories from URIs.
      Returns: `TRUE` if the appinfo supports URIs.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSupportsUris`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSupportsUris()
  {
    auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.app_info.AppInfo._getGType);
    if (!_klass || !_klass.supportsUris)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.supportsUris(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Adds a content type to the application information to indicate the
      application is capable of opening files with the given content type.
  
      Params:
        contentType = a string.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  */
  override bool addSupportsType(string contentType)
  {
    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_app_info_add_supports_type(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Obtains the information whether the [gid.gio2.app_info.AppInfo] can be deleted.
      See [gid.gio2.app_info.AppInfo.delete_].
      Returns: `TRUE` if appinfo can be deleted
  */
  override bool canDelete() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_app_info_can_delete(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a supported content type can be removed from an application.
      Returns: `TRUE` if it is possible to remove supported content types from a
          given appinfo, `FALSE` if not.
  */
  override bool canRemoveSupportsType() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_app_info_can_remove_supports_type(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Tries to delete a [gid.gio2.app_info.AppInfo].
      
      On some platforms, there may be a difference between user-defined
      [gid.gio2.app_info.AppInfo]s which can be deleted, and system-wide ones which cannot.
      See [gid.gio2.app_info.AppInfo.canDelete].
      Returns: `TRUE` if appinfo has been deleted
  */
  override bool delete_() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_app_info_delete(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Creates a duplicate of a [gid.gio2.app_info.AppInfo].
      Returns: a duplicate of appinfo.
  */
  override gid.gio2.app_info.AppInfo dup() nothrow
  {
    GAppInfo* _cretval;
    _cretval = g_app_info_dup(cast(GAppInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if two [gid.gio2.app_info.AppInfo]s are equal.
      
      Note that the check *may not* compare each individual field, and only does
      an identity check. In case detecting changes in the contents is needed,
      program code must additionally compare relevant fields.
  
      Params:
        appinfo2 = the second [gid.gio2.app_info.AppInfo].
      Returns: `TRUE` if appinfo1 is equal to appinfo2. `FALSE` otherwise.
  */
  override bool equal(gid.gio2.app_info.AppInfo appinfo2) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_app_info_equal(cast(GAppInfo*)this._cPtr, appinfo2 ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)appinfo2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the commandline with which the application will be
      started.
      Returns: a string containing the appinfo’s
          commandline, or `NULL` if this information is not available
  */
  override string getCommandline() nothrow
  {
    const(char)* _cretval;
    _cretval = g_app_info_get_commandline(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a human-readable description of an installed application.
      Returns: a string containing a description of the
        application appinfo, or `NULL` if none.
  */
  override string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = g_app_info_get_description(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the display name of the application. The display name is often more
      descriptive to the user than the name itself.
      Returns: the display name of the application for appinfo, or the name if
        no display name is available.
  */
  override string getDisplayName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_app_info_get_display_name(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the executable’s name for the installed application.
      
      This is intended to be used for debugging or labelling what program is going
      to be run. To launch the executable, use [gid.gio2.app_info.AppInfo.launch] and related
      functions, rather than spawning the return value from this function.
      Returns: a string containing the appinfo’s application
        binaries name
  */
  override string getExecutable() nothrow
  {
    const(char)* _cretval;
    _cretval = g_app_info_get_executable(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the icon for the application.
      Returns: the default [gid.gio2.icon.Icon] for
          appinfo or `NULL` if there is no default icon.
  */
  override gid.gio2.icon.Icon getIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = g_app_info_get_icon(cast(GAppInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the ID of an application. An id is a string that identifies the
      application. The exact format of the id is platform dependent. For instance,
      on Unix this is the desktop file id from the xdg menu specification.
      
      Note that the returned ID may be `NULL`, depending on how the appinfo has
      been constructed.
      Returns: a string containing the application’s ID.
  */
  override string getId() nothrow
  {
    const(char)* _cretval;
    _cretval = g_app_info_get_id(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the installed name of the application.
      Returns: the name of the application for appinfo.
  */
  override string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_app_info_get_name(cast(GAppInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the list of content types that app_info claims to support.
      If this information is not provided by the environment, this function
      will return `NULL`.
      
      This function does not take in consideration associations added with
      [gid.gio2.app_info.AppInfo.addSupportsType], but only those exported directly by
      the application.
      Returns: a list of content types.
  */
  override string[] getSupportedTypes() nothrow
  {
    const(char*)* _cretval;
    _cretval = g_app_info_get_supported_types(cast(GAppInfo*)this._cPtr);
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
      Launches the application. Passes files to the launched application
      as arguments, using the optional context to get information
      about the details of the launcher (like what screen it is on).
      On error, error will be set accordingly.
      
      To launch the application without arguments pass a `NULL` files list.
      
      Note that even if the launch is successful the application launched
      can fail to start if it runs into problems during startup. There is
      no way to detect this.
      
      Some URIs can be changed when passed through a GFile (for instance
      unsupported URIs with strange formats like mailto:), so if you have
      a textual URI you want to pass in as argument, consider using
      [gid.gio2.app_info.AppInfo.launchUris] instead.
      
      The launched application inherits the environment of the launching
      process, but it can be modified with [gid.gio2.app_launch_context.AppLaunchContext.setenv]
      and [gid.gio2.app_launch_context.AppLaunchContext.unsetenv].
      
      On UNIX, this function sets the `GIO_LAUNCHED_DESKTOP_FILE`
      environment variable with the path of the launched desktop file and
      `GIO_LAUNCHED_DESKTOP_FILE_PID` to the process id of the launched
      process. This can be used to ignore `GIO_LAUNCHED_DESKTOP_FILE`,
      should it be inherited by further processes. The `DISPLAY`,
      `XDG_ACTIVATION_TOKEN` and `DESKTOP_STARTUP_ID` environment
      variables are also set, based on information provided in context.
  
      Params:
        files = a list of [gid.gio2.file.File] objects
        context = the launch context
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  */
  override bool launch(gid.gio2.file.File[] files = null, gid.gio2.app_launch_context.AppLaunchContext context = null)
  {
    bool _retval;
    auto _files = gListFromD!(gid.gio2.file.File)(files);
    scope(exit) containerFree!(GList*, gid.gio2.file.File, GidOwnership.None)(_files);
    GError *_err;
    _retval = cast(bool)g_app_info_launch(cast(GAppInfo*)this._cPtr, _files, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Launches the application. This passes the uris to the launched application
      as arguments, using the optional context to get information
      about the details of the launcher (like what screen it is on).
      On error, error will be set accordingly. If the application only supports
      one URI per invocation as part of their command-line, multiple instances
      of the application will be spawned.
      
      To launch the application without arguments pass a `NULL` uris list.
      
      Note that even if the launch is successful the application launched
      can fail to start if it runs into problems during startup. There is
      no way to detect this.
  
      Params:
        uris = a list of URIs to launch.
        context = the launch context
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  */
  override bool launchUris(string[] uris = null, gid.gio2.app_launch_context.AppLaunchContext context = null)
  {
    bool _retval;
    auto _uris = gListFromD!(string)(uris);
    scope(exit) containerFree!(GList*, string, GidOwnership.None)(_uris);
    GError *_err;
    _retval = cast(bool)g_app_info_launch_uris(cast(GAppInfo*)this._cPtr, _uris, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Async version of [gid.gio2.app_info.AppInfo.launchUris].
      
      The callback is invoked immediately after the application launch, but it
      waits for activation in case of D-Bus–activated applications and also provides
      extended error information for sandboxed applications, see notes for
      [gid.gio2.app_info.AppInfo.launchDefaultForUriAsync].
  
      Params:
        uris = a list of URIs to launch.
        context = the launch context
        cancellable = a [gid.gio2.cancellable.Cancellable]
        callback = a [gid.gio2.types.AsyncReadyCallback] to call
            when the request is done
  */
  override void launchUrisAsync(string[] uris = null, gid.gio2.app_launch_context.AppLaunchContext context = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _uris = gListFromD!(string)(uris);
    scope(exit) containerFree!(GList*, string, GidOwnership.None)(_uris);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_app_info_launch_uris_async(cast(GAppInfo*)this._cPtr, _uris, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a [gid.gio2.app_info.AppInfo.launchUrisAsync] operation.
  
      Params:
        result = the async result
      Returns: `TRUE` on successful launch, `FALSE` otherwise.
      Throws: [ErrorWrap]
  */
  override bool launchUrisFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_app_info_launch_uris_finish(cast(GAppInfo*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Removes a supported type from an application, if possible.
  
      Params:
        contentType = a string.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  */
  override bool removeSupportsType(string contentType)
  {
    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_app_info_remove_supports_type(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the application as the default handler for the given file extension.
  
      Params:
        extension = a string containing the file extension (without
            the dot).
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  */
  override bool setAsDefaultForExtension(string extension)
  {
    bool _retval;
    const(char)* _extension = extension.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_app_info_set_as_default_for_extension(cast(GAppInfo*)this._cPtr, _extension, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the application as the default handler for a given type.
  
      Params:
        contentType = the content type.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  */
  override bool setAsDefaultForType(string contentType)
  {
    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_app_info_set_as_default_for_type(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the application as the last used application for a given type. This
      will make the application appear as first in the list returned by
      [gid.gio2.app_info.AppInfo.getRecommendedForType], regardless of the default
      application for that content type.
  
      Params:
        contentType = the content type.
      Returns: `TRUE` on success, `FALSE` on error.
      Throws: [ErrorWrap]
  */
  override bool setAsLastUsedForType(string contentType)
  {
    bool _retval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_app_info_set_as_last_used_for_type(cast(GAppInfo*)this._cPtr, _contentType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks if the application info should be shown in menus that
      list available applications.
      Returns: `TRUE` if the appinfo should be shown, `FALSE` otherwise.
  */
  override bool shouldShow() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_app_info_should_show(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the application accepts files as arguments.
      Returns: `TRUE` if the appinfo supports files.
  */
  override bool supportsFiles() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_app_info_supports_files(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the application supports reading files and directories from URIs.
      Returns: `TRUE` if the appinfo supports URIs.
  */
  override bool supportsUris() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_app_info_supports_uris(cast(GAppInfo*)this._cPtr);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.app_info.AppInfo (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_app_info_AppInfo(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddSupportsType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanDelete", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanRemoveSupportsType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDoDelete", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDup", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCommandline", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDescription", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDisplayName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetExecutable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetId", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSupportedTypes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunch", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunchUris", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunchUrisAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunchUrisFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveSupportsType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAsDefaultForExtension", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAsDefaultForType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAsLastUsedForType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncShouldShow", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsFiles", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsUris", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.app_info.AppInfo vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_app_info_AppInfo(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddSupportsType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "add_supports_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanDelete", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "can_delete");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanRemoveSupportsType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "can_remove_supports_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDoDelete", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "do_delete");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDup", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "dup");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "equal");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCommandline", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncGetCommandline is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncGetDescription is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDisplayName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncGetDisplayName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetExecutable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncGetExecutable is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIcon", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "get_icon");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetId", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncGetId is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncGetName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSupportedTypes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncGetSupportedTypes is not supported: callback return container type 'Array' ownership 'None' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunch", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "launch");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunchUris", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "launch_uris");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunchUrisAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.app_info.AppInfo.vfuncLaunchUrisAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLaunchUrisFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "launch_uris_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveSupportsType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "remove_supports_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAsDefaultForExtension", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "set_as_default_for_extension");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAsDefaultForType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "set_as_default_for_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetAsLastUsedForType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "set_as_last_used_for_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncShouldShow", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "should_show");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsFiles", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "supports_files");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsUris", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_app_info_AppInfo(iface, "supports_uris");
  }

  private static void _installIfaceVfunc_gid_gio2_app_info_AppInfo(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GAppInfoIface*)iface;

    switch (vfunc)
    {
      case "add_supports_type":
      {
        static extern(C) gboolean _vfuncAddSupportsTypeTramp(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.addSupportsType)
              return (cast(typeof(&_vfuncAddSupportsTypeTramp))_klass.addSupportsType)(appinfo, contentType, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _contentType = contentType.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncAddSupportsType(_contentType);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.addSupportsType = cast(typeof(_klass.addSupportsType))&_vfuncAddSupportsTypeTramp;
        break;
      }
      case "can_delete":
      {
        static extern(C) gboolean _vfuncCanDeleteTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.canDelete)
              return (cast(typeof(&_vfuncCanDeleteTramp))_klass.canDelete)(appinfo);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanDelete();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncCanDelete");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canDelete = cast(typeof(_klass.canDelete))&_vfuncCanDeleteTramp;
        break;
      }
      case "can_remove_supports_type":
      {
        static extern(C) gboolean _vfuncCanRemoveSupportsTypeTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.canRemoveSupportsType)
              return (cast(typeof(&_vfuncCanRemoveSupportsTypeTramp))_klass.canRemoveSupportsType)(appinfo);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanRemoveSupportsType();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncCanRemoveSupportsType");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canRemoveSupportsType = cast(typeof(_klass.canRemoveSupportsType))&_vfuncCanRemoveSupportsTypeTramp;
        break;
      }
      case "do_delete":
      {
        static extern(C) gboolean _vfuncDoDeleteTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.doDelete)
              return (cast(typeof(&_vfuncDoDeleteTramp))_klass.doDelete)(appinfo);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDoDelete();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncDoDelete");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.doDelete = cast(typeof(_klass.doDelete))&_vfuncDoDeleteTramp;
        break;
      }
      case "dup":
      {
        static extern(C) GAppInfo* _vfuncDupTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.dup)
              return (cast(typeof(&_vfuncDupTramp))_klass.dup)(appinfo);
            return typeof(return).init;
          }

          gid.gio2.app_info.AppInfo _dretval;

          try
          {
            _dretval = _obj.vfuncDup();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncDup");
          }
          auto _retval = _dretval ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.dup = cast(typeof(_klass.dup))&_vfuncDupTramp;
        break;
      }
      case "equal":
      {
        static extern(C) gboolean _vfuncEqualTramp(GAppInfo* appinfo1, GAppInfo* appinfo2) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo1);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo1), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.equal)
              return (cast(typeof(&_vfuncEqualTramp))_klass.equal)(appinfo1, appinfo2);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEqual(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(void*)appinfo2, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncEqual");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.equal = cast(typeof(_klass.equal))&_vfuncEqualTramp;
        break;
      }
      case "get_icon":
      {
        static extern(C) GIcon* _vfuncGetIconTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.getIcon)
              return (cast(typeof(&_vfuncGetIconTramp))_klass.getIcon)(appinfo);
            return typeof(return).init;
          }

          gid.gio2.icon.Icon _dretval;

          try
          {
            _dretval = _obj.vfuncGetIcon();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncGetIcon");
          }
          auto _retval = _dretval ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getIcon = cast(typeof(_klass.getIcon))&_vfuncGetIconTramp;
        break;
      }
      case "launch":
      {
        static extern(C) gboolean _vfuncLaunchTramp(GAppInfo* appinfo, GList* files, GAppLaunchContext* context, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.launch)
              return (cast(typeof(&_vfuncLaunchTramp))_klass.launch)(appinfo, files, context, _err);
            return typeof(return).init;
          }

          bool _dretval;
          auto _files = gListToD!(gid.gio2.file.File, GidOwnership.None)(files);

          try
          {
            _dretval = _obj.vfuncLaunch(_files, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_launch_context.AppLaunchContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.launch = cast(typeof(_klass.launch))&_vfuncLaunchTramp;
        break;
      }
      case "launch_uris":
      {
        static extern(C) gboolean _vfuncLaunchUrisTramp(GAppInfo* appinfo, GList* uris, GAppLaunchContext* context, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.launchUris)
              return (cast(typeof(&_vfuncLaunchUrisTramp))_klass.launchUris)(appinfo, uris, context, _err);
            return typeof(return).init;
          }

          bool _dretval;
          auto _uris = gListToD!(string, GidOwnership.None)(uris);

          try
          {
            _dretval = _obj.vfuncLaunchUris(_uris, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_launch_context.AppLaunchContext)(cast(void*)context, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.launchUris = cast(typeof(_klass.launchUris))&_vfuncLaunchUrisTramp;
        break;
      }
      case "launch_uris_finish":
      {
        static extern(C) gboolean _vfuncLaunchUrisFinishTramp(GAppInfo* appinfo, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.launchUrisFinish)
              return (cast(typeof(&_vfuncLaunchUrisFinishTramp))_klass.launchUrisFinish)(appinfo, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncLaunchUrisFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.launchUrisFinish = cast(typeof(_klass.launchUrisFinish))&_vfuncLaunchUrisFinishTramp;
        break;
      }
      case "remove_supports_type":
      {
        static extern(C) gboolean _vfuncRemoveSupportsTypeTramp(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.removeSupportsType)
              return (cast(typeof(&_vfuncRemoveSupportsTypeTramp))_klass.removeSupportsType)(appinfo, contentType, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _contentType = contentType.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncRemoveSupportsType(_contentType);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.removeSupportsType = cast(typeof(_klass.removeSupportsType))&_vfuncRemoveSupportsTypeTramp;
        break;
      }
      case "set_as_default_for_extension":
      {
        static extern(C) gboolean _vfuncSetAsDefaultForExtensionTramp(GAppInfo* appinfo, const(char)* extension, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.setAsDefaultForExtension)
              return (cast(typeof(&_vfuncSetAsDefaultForExtensionTramp))_klass.setAsDefaultForExtension)(appinfo, extension, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _extension = extension.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetAsDefaultForExtension(_extension);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setAsDefaultForExtension = cast(typeof(_klass.setAsDefaultForExtension))&_vfuncSetAsDefaultForExtensionTramp;
        break;
      }
      case "set_as_default_for_type":
      {
        static extern(C) gboolean _vfuncSetAsDefaultForTypeTramp(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.setAsDefaultForType)
              return (cast(typeof(&_vfuncSetAsDefaultForTypeTramp))_klass.setAsDefaultForType)(appinfo, contentType, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _contentType = contentType.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetAsDefaultForType(_contentType);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setAsDefaultForType = cast(typeof(_klass.setAsDefaultForType))&_vfuncSetAsDefaultForTypeTramp;
        break;
      }
      case "set_as_last_used_for_type":
      {
        static extern(C) gboolean _vfuncSetAsLastUsedForTypeTramp(GAppInfo* appinfo, const(char)* contentType, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.setAsLastUsedForType)
              return (cast(typeof(&_vfuncSetAsLastUsedForTypeTramp))_klass.setAsLastUsedForType)(appinfo, contentType, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _contentType = contentType.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetAsLastUsedForType(_contentType);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setAsLastUsedForType = cast(typeof(_klass.setAsLastUsedForType))&_vfuncSetAsLastUsedForTypeTramp;
        break;
      }
      case "should_show":
      {
        static extern(C) gboolean _vfuncShouldShowTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.shouldShow)
              return (cast(typeof(&_vfuncShouldShowTramp))_klass.shouldShow)(appinfo);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncShouldShow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncShouldShow");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.shouldShow = cast(typeof(_klass.shouldShow))&_vfuncShouldShowTramp;
        break;
      }
      case "supports_files":
      {
        static extern(C) gboolean _vfuncSupportsFilesTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.supportsFiles)
              return (cast(typeof(&_vfuncSupportsFilesTramp))_klass.supportsFiles)(appinfo);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSupportsFiles();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncSupportsFiles");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.supportsFiles = cast(typeof(_klass.supportsFiles))&_vfuncSupportsFilesTramp;
        break;
      }
      case "supports_uris":
      {
        static extern(C) gboolean _vfuncSupportsUrisTramp(GAppInfo* appinfo) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)appinfo);
          if (!_obj)
          {
            auto _klass = cast(GAppInfoIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)appinfo), gid.gio2.app_info.AppInfo._getGType);
            if (_klass && _klass.supportsUris)
              return (cast(typeof(&_vfuncSupportsUrisTramp))_klass.supportsUris)(appinfo);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSupportsUris();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.app_info.AppInfo.vfuncSupportsUris");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.supportsUris = cast(typeof(_klass.supportsUris))&_vfuncSupportsUrisTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.app_info.AppInfo]
template AppInfoGidBuilderT()
{
}
