/// Module for [AppInfo] interface
module gio.app_info;

public import gio.app_info_iface_proxy;
import gid.gid;
import gio.app_launch_context;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.file;
import gio.icon;
import gio.types;
import glib.error;
import gobject.object;

/**
    Information about an installed application and methods to launch
    it (with file arguments).
    
    [gio.app_info.AppInfo] and [gio.app_launch_context.AppLaunchContext] are used for describing and launching
    applications installed on the system.
    
    As of GLib 2.20, URIs will always be converted to POSIX paths
    (using [gio.file.File.getPath]) when using [gio.app_info.AppInfo.launch]
    even if the application requested an URI and not a POSIX path. For example
    for a desktop-file based application with Exec key `totem
    `U`` and a single URI, `sftp://foo/file.avi`, then
    `/home/user/.gvfs/sftp on foo/file.avi` will be passed. This will
    only work if a set of suitable GIO extensions (such as GVfs 2.26
    compiled with FUSE support), is available and operational; if this
    is not the case, the URI will be passed unmodified to the application.
    Some URIs, such as `mailto:`, of course cannot be mapped to a POSIX
    path (in GVfs there's no FUSE mount for it); such URIs will be
    passed unmodified to the application.
    
    Specifically for GVfs 2.26 and later, the POSIX URI will be mapped
    back to the GIO URI in the [gio.file.File] constructors (since GVfs
    implements the GVfs extension point). As such, if the application
    needs to examine the URI, it needs to use [gio.file.File.getUri]
    or similar on [gio.file.File]. In other words, an application cannot
    assume that the URI passed to e.g. [gio.file.File.newForCommandlineArg]
    is equal to the result of [gio.file.File.getUri]. The following snippet
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
    application. It should be noted that it's generally not safe
    for applications to rely on the format of a particular URIs.
    Different launcher applications (e.g. file managers) may have
    different ideas of what a given URI means.
*/
interface AppInfo
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_app_info_get_type != &gidSymbolNotFound ? g_app_info_get_type() : cast(GType)0;
  }

  /**
      Creates a new #GAppInfo from the given information.
      
      Note that for commandline, the quoting rules of the Exec key of the
      [freedesktop.org Desktop Entry Specification](http://freedesktop.org/Standards/desktop-entry-spec)
      are applied. For example, if the commandline contains
      percent-encoded URIs, the percent-character must be doubled in order to prevent it from
      being swallowed by Exec key unquoting. See the specification for exact quoting rules.
  
      Params:
        commandline = the commandline to use
        applicationName = the application name, or null to use commandline
        flags = flags that can specify details of the created #GAppInfo
      Returns: new #GAppInfo for given command.
      Throws: [ErrorWrap]
  */
  static gio.app_info.AppInfo createFromCommandline(string commandline, string applicationName, gio.types.AppInfoCreateFlags flags)
  {
    GAppInfo* _cretval;
    const(char)* _commandline = commandline.toCString(No.Alloc);
    const(char)* _applicationName = applicationName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_app_info_create_from_commandline(_commandline, _applicationName, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of all of the applications currently registered
      on this system.
      
      For desktop files, this includes applications that have
      `NoDisplay=true` set or are excluded from display by means
      of `OnlyShowIn` or `NotShowIn`. See [gio.app_info.AppInfo.shouldShow].
      The returned list does not include applications which have
      the `Hidden` key set.
      Returns: a newly allocated #GList of references to #GAppInfos.
  */
  static gio.app_info.AppInfo[] getAll()
  {
    GList* _cretval;
    _cretval = g_app_info_get_all();
    auto _retval = gListToD!(gio.app_info.AppInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets a list of all #GAppInfos for a given content type,
      including the recommended and fallback #GAppInfos. See
      [gio.app_info.AppInfo.getRecommendedForType] and
      [gio.app_info.AppInfo.getFallbackForType].
  
      Params:
        contentType = the content type to find a #GAppInfo for
      Returns: #GList of #GAppInfos
            for given content_type or null on error.
  */
  static gio.app_info.AppInfo[] getAllForType(string contentType)
  {
    GList* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = g_app_info_get_all_for_type(_contentType);
    auto _retval = gListToD!(gio.app_info.AppInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the default #GAppInfo for a given content type.
  
      Params:
        contentType = the content type to find a #GAppInfo for
        mustSupportUris = if true, the #GAppInfo is expected to
              support URIs
      Returns: #GAppInfo for given content_type or
            null on error.
  */
  static gio.app_info.AppInfo getDefaultForType(string contentType, bool mustSupportUris)
  {
    GAppInfo* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = g_app_info_get_default_for_type(_contentType, mustSupportUris);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the default #GAppInfo for a given content type.
  
      Params:
        contentType = the content type to find a #GAppInfo for
        mustSupportUris = if true, the #GAppInfo is expected to
              support URIs
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is done
  */
  static void getDefaultForTypeAsync(string contentType, bool mustSupportUris, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_app_info_get_default_for_type_async(_contentType, mustSupportUris, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a default #GAppInfo lookup started by
      [gio.app_info.AppInfo.getDefaultForTypeAsync].
      
      If no #GAppInfo is found, then error will be set to [gio.types.IOErrorEnum.NotFound].
  
      Params:
        result = a #GAsyncResult
      Returns: #GAppInfo for given content_type or
            null on error.
      Throws: [ErrorWrap]
  */
  static gio.app_info.AppInfo getDefaultForTypeFinish(gio.async_result.AsyncResult result)
  {
    GAppInfo* _cretval;
    GError *_err;
    _cretval = g_app_info_get_default_for_type_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the default application for handling URIs with
      the given URI scheme. A URI scheme is the initial part
      of the URI, up to but not including the ':', e.g. "http",
      "ftp" or "sip".
  
      Params:
        uriScheme = a string containing a URI scheme.
      Returns: #GAppInfo for given uri_scheme or
            null on error.
  */
  static gio.app_info.AppInfo getDefaultForUriScheme(string uriScheme)
  {
    GAppInfo* _cretval;
    const(char)* _uriScheme = uriScheme.toCString(No.Alloc);
    _cretval = g_app_info_get_default_for_uri_scheme(_uriScheme);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously gets the default application for handling URIs with
      the given URI scheme. A URI scheme is the initial part
      of the URI, up to but not including the ':', e.g. "http",
      "ftp" or "sip".
  
      Params:
        uriScheme = a string containing a URI scheme.
        cancellable = optional #GCancellable object, null to ignore
        callback = a #GAsyncReadyCallback to call when the request is done
  */
  static void getDefaultForUriSchemeAsync(string uriScheme, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _uriScheme = uriScheme.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_app_info_get_default_for_uri_scheme_async(_uriScheme, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes a default #GAppInfo lookup started by
      [gio.app_info.AppInfo.getDefaultForUriSchemeAsync].
      
      If no #GAppInfo is found, then error will be set to [gio.types.IOErrorEnum.NotFound].
  
      Params:
        result = a #GAsyncResult
      Returns: #GAppInfo for given uri_scheme or
            null on error.
      Throws: [ErrorWrap]
  */
  static gio.app_info.AppInfo getDefaultForUriSchemeFinish(gio.async_result.AsyncResult result)
  {
    GAppInfo* _cretval;
    GError *_err;
    _cretval = g_app_info_get_default_for_uri_scheme_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of fallback #GAppInfos for a given content type, i.e.
      those applications which claim to support the given content type
      by MIME type subclassing and not directly.
  
      Params:
        contentType = the content type to find a #GAppInfo for
      Returns: #GList of #GAppInfos
            for given content_type or null on error.
  */
  static gio.app_info.AppInfo[] getFallbackForType(string contentType)
  {
    GList* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = g_app_info_get_fallback_for_type(_contentType);
    auto _retval = gListToD!(gio.app_info.AppInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets a list of recommended #GAppInfos for a given content type, i.e.
      those applications which claim to support the given content type exactly,
      and not by MIME type subclassing.
      Note that the first application of the list is the last used one, i.e.
      the last one for which [gio.app_info.AppInfo.setAsLastUsedForType] has been
      called.
  
      Params:
        contentType = the content type to find a #GAppInfo for
      Returns: #GList of #GAppInfos
            for given content_type or null on error.
  */
  static gio.app_info.AppInfo[] getRecommendedForType(string contentType)
  {
    GList* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = g_app_info_get_recommended_for_type(_contentType);
    auto _retval = gListToD!(gio.app_info.AppInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Utility function that launches the default application
      registered to handle the specified uri. Synchronous I/O
      is done on the uri to detect the type of the file if
      required.
      
      The D-Bus–activated applications don't have to be started if your application
      terminates too soon after this function. To prevent this, use
      [gio.app_info.AppInfo.launchDefaultForUriAsync] instead.
  
      Params:
        uri = the uri to show
        context = an optional #GAppLaunchContext
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  static bool launchDefaultForUri(string uri, gio.app_launch_context.AppLaunchContext context = null)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)g_app_info_launch_default_for_uri(_uri, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Async version of [gio.app_info.AppInfo.launchDefaultForUri].
      
      This version is useful if you are interested in receiving
      error information in the case where the application is
      sandboxed and the portal may present an application chooser
      dialog to the user.
      
      This is also useful if you want to be sure that the D-Bus–activated
      applications are really started before termination and if you are interested
      in receiving error information from their activation.
  
      Params:
        uri = the uri to show
        context = an optional #GAppLaunchContext
        cancellable = a #GCancellable
        callback = a #GAsyncReadyCallback to call when the request is done
  */
  static void launchDefaultForUriAsync(string uri, gio.app_launch_context.AppLaunchContext context = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _uri = uri.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_app_info_launch_default_for_uri_async(_uri, context ? cast(GAppLaunchContext*)context._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous launch-default-for-uri operation.
  
      Params:
        result = a #GAsyncResult
      Returns: true if the launch was successful, false if error is set
      Throws: [ErrorWrap]
  */
  static bool launchDefaultForUriFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_app_info_launch_default_for_uri_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Removes all changes to the type associations done by
      [gio.app_info.AppInfo.setAsDefaultForType],
      [gio.app_info.AppInfo.setAsDefaultForExtension],
      [gio.app_info.AppInfo.addSupportsType] or
      [gio.app_info.AppInfo.removeSupportsType].
  
      Params:
        contentType = a content type
  */
  static void resetTypeAssociations(string contentType)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    g_app_info_reset_type_associations(_contentType);
  }

  /**
      Adds a content type to the application information to indicate the
      application is capable of opening files with the given content type.
  
      Params:
        contentType = a string.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool addSupportsType(string contentType);

  /**
      Obtains the information whether the #GAppInfo can be deleted.
      See [gio.app_info.AppInfo.delete_].
      Returns: true if appinfo can be deleted
  */
  bool canDelete();

  /**
      Checks if a supported content type can be removed from an application.
      Returns: true if it is possible to remove supported
            content types from a given appinfo, false if not.
  */
  bool canRemoveSupportsType();

  /**
      Tries to delete a #GAppInfo.
      
      On some platforms, there may be a difference between user-defined
      #GAppInfos which can be deleted, and system-wide ones which cannot.
      See [gio.app_info.AppInfo.canDelete].
      Returns: true if appinfo has been deleted
  */
  bool delete_();

  /**
      Creates a duplicate of a #GAppInfo.
      Returns: a duplicate of appinfo.
  */
  gio.app_info.AppInfo dup();

  /**
      Checks if two #GAppInfos are equal.
      
      Note that the check *may not* compare each individual
      field, and only does an identity check. In case detecting changes in the
      contents is needed, program code must additionally compare relevant fields.
  
      Params:
        appinfo2 = the second #GAppInfo.
      Returns: true if appinfo1 is equal to appinfo2. false otherwise.
  */
  bool equal(gio.app_info.AppInfo appinfo2);

  /**
      Gets the commandline with which the application will be
      started.
      Returns: a string containing the appinfo's commandline,
            or null if this information is not available
  */
  string getCommandline();

  /**
      Gets a human-readable description of an installed application.
      Returns: a string containing a description of the
        application appinfo, or null if none.
  */
  string getDescription();

  /**
      Gets the display name of the application. The display name is often more
      descriptive to the user than the name itself.
      Returns: the display name of the application for appinfo, or the name if
        no display name is available.
  */
  string getDisplayName();

  /**
      Gets the executable's name for the installed application.
      
      This is intended to be used for debugging or labelling what program is going
      to be run. To launch the executable, use [gio.app_info.AppInfo.launch] and related
      functions, rather than spawning the return value from this function.
      Returns: a string containing the appinfo's application
        binaries name
  */
  string getExecutable();

  /**
      Gets the icon for the application.
      Returns: the default #GIcon for appinfo or null
        if there is no default icon.
  */
  gio.icon.Icon getIcon();

  /**
      Gets the ID of an application. An id is a string that
      identifies the application. The exact format of the id is
      platform dependent. For instance, on Unix this is the
      desktop file id from the xdg menu specification.
      
      Note that the returned ID may be null, depending on how
      the appinfo has been constructed.
      Returns: a string containing the application's ID.
  */
  string getId();

  /**
      Gets the installed name of the application.
      Returns: the name of the application for appinfo.
  */
  string getName();

  /**
      Retrieves the list of content types that app_info claims to support.
      If this information is not provided by the environment, this function
      will return null.
      This function does not take in consideration associations added with
      [gio.app_info.AppInfo.addSupportsType], but only those exported directly by
      the application.
      Returns: a list of content types.
  */
  string[] getSupportedTypes();

  /**
      Launches the application. Passes files to the launched application
      as arguments, using the optional context to get information
      about the details of the launcher (like what screen it is on).
      On error, error will be set accordingly.
      
      To launch the application without arguments pass a null files list.
      
      Note that even if the launch is successful the application launched
      can fail to start if it runs into problems during startup. There is
      no way to detect this.
      
      Some URIs can be changed when passed through a GFile (for instance
      unsupported URIs with strange formats like mailto:), so if you have
      a textual URI you want to pass in as argument, consider using
      [gio.app_info.AppInfo.launchUris] instead.
      
      The launched application inherits the environment of the launching
      process, but it can be modified with [gio.app_launch_context.AppLaunchContext.setenv]
      and [gio.app_launch_context.AppLaunchContext.unsetenv].
      
      On UNIX, this function sets the `GIO_LAUNCHED_DESKTOP_FILE`
      environment variable with the path of the launched desktop file and
      `GIO_LAUNCHED_DESKTOP_FILE_PID` to the process id of the launched
      process. This can be used to ignore `GIO_LAUNCHED_DESKTOP_FILE`,
      should it be inherited by further processes. The `DISPLAY`,
      `XDG_ACTIVATION_TOKEN` and `DESKTOP_STARTUP_ID` environment
      variables are also set, based on information provided in context.
  
      Params:
        files = a #GList of #GFile objects
        context = a #GAppLaunchContext or null
      Returns: true on successful launch, false otherwise.
      Throws: [ErrorWrap]
  */
  bool launch(gio.file.File[] files = null, gio.app_launch_context.AppLaunchContext context = null);

  /**
      Launches the application. This passes the uris to the launched application
      as arguments, using the optional context to get information
      about the details of the launcher (like what screen it is on).
      On error, error will be set accordingly. If the application only supports
      one URI per invocation as part of their command-line, multiple instances
      of the application will be spawned.
      
      To launch the application without arguments pass a null uris list.
      
      Note that even if the launch is successful the application launched
      can fail to start if it runs into problems during startup. There is
      no way to detect this.
  
      Params:
        uris = a #GList containing URIs to launch.
        context = a #GAppLaunchContext or null
      Returns: true on successful launch, false otherwise.
      Throws: [ErrorWrap]
  */
  bool launchUris(string[] uris = null, gio.app_launch_context.AppLaunchContext context = null);

  /**
      Async version of [gio.app_info.AppInfo.launchUris].
      
      The callback is invoked immediately after the application launch, but it
      waits for activation in case of D-Bus–activated applications and also provides
      extended error information for sandboxed applications, see notes for
      [gio.app_info.AppInfo.launchDefaultForUriAsync].
  
      Params:
        uris = a #GList containing URIs to launch.
        context = a #GAppLaunchContext or null
        cancellable = a #GCancellable
        callback = a #GAsyncReadyCallback to call when the request is done
  */
  void launchUrisAsync(string[] uris = null, gio.app_launch_context.AppLaunchContext context = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes a [gio.app_info.AppInfo.launchUrisAsync] operation.
  
      Params:
        result = a #GAsyncResult
      Returns: true on successful launch, false otherwise.
      Throws: [ErrorWrap]
  */
  bool launchUrisFinish(gio.async_result.AsyncResult result);

  /**
      Removes a supported type from an application, if possible.
  
      Params:
        contentType = a string.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool removeSupportsType(string contentType);

  /**
      Sets the application as the default handler for the given file extension.
  
      Params:
        extension = a string containing the file extension
              (without the dot).
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool setAsDefaultForExtension(string extension);

  /**
      Sets the application as the default handler for a given type.
  
      Params:
        contentType = the content type.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool setAsDefaultForType(string contentType);

  /**
      Sets the application as the last used application for a given type.
      This will make the application appear as first in the list returned
      by [gio.app_info.AppInfo.getRecommendedForType], regardless of the default
      application for that content type.
  
      Params:
        contentType = the content type.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool setAsLastUsedForType(string contentType);

  /**
      Checks if the application info should be shown in menus that
      list available applications.
      Returns: true if the appinfo should be shown, false otherwise.
  */
  bool shouldShow();

  /**
      Checks if the application accepts files as arguments.
      Returns: true if the appinfo supports files.
  */
  bool supportsFiles();

  /**
      Checks if the application supports reading files and directories from URIs.
      Returns: true if the appinfo supports URIs.
  */
  bool supportsUris();
}
